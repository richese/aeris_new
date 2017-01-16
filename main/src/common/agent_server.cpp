#include <future> // std::async, std::future
#include <memory> // std::shared_ptr
#include <map> // std::map
#include <mutex> // std::lock_guard, std::mutex
#include <thread>
#include <vector> // std::vector
#include <utility> // std::pair

#include "agent_server.h"
#include "communication_header.h"
#include "config.h"
#include "logging.h"
#include "signals.h"
#include "socket.h"
#include "timing.h"


ae::Server::Server() :
  m_session_id(0), // TODO
  m_agent_group_counter(0),
  m_global_state(),
  m_read_buffer(nullptr),
  m_lock_global_state(),
  m_lock_read_buffer(),
  m_sockets()
{

}


ae::Server::~Server()
{

}


int ae::Server::main()
{
  std::vector<std::future<void>> request_handlers;
  std::shared_ptr<Socket> socket;
  auto agent_check_time = time::clock::now() + time::seconds(1);

  if (listen() < 0)
  {
    return -1;
  }

  while (!signal::exit())
  {
    // check for expired agents
    if (agent_check_time <= time::clock::now())
    {
      agent_check_time += time::seconds(1);
      expired_agent_check();
    }

    // cleanup finished request handlers
    if (!request_handlers.empty())
    {
      for (auto it = request_handlers.begin(); it != request_handlers.end();)
      {
        if (it->wait_for(std::chrono::milliseconds(0)) == std::future_status::ready)
        {
          it = request_handlers.erase(it);
        }
        else
        {
          ++it;
        }
      }
    }

    // select socket ready for read operation from socket pool
    if (request_handlers.empty())
    {
      // sleep longer if there are no requests that can return sockets to pool
      socket = m_sockets.select(1000);
    }
    else
    {
      socket = m_sockets.select(5);
    }
    if (!socket)
    {
      continue;
    }

    switch (socket->type())
    {
      // accept new client connection
      case Socket::TYPE_SERVER:
      {
        std::shared_ptr<Socket> new_client = socket->accept();
        if (new_client)
        {
          VLOG(3) << "Accepted connection from " << *new_client;
          m_sockets.add_socket(new_client);
        }
        break;
      }
      // process a request from client
      case Socket::TYPE_ACCEPT:
      {
        m_sockets.del_socket(socket->fd());
        request_handlers.push_back(std::async(&Server::request_handler, this, socket));
        break;
      }
      default:
        break;
    }
  }

  if (!request_handlers.empty())
  {
    VLOG(3) << "Waiting for request handlers to finish.";
    for (auto &handler : request_handlers)
    {
      handler.wait();
    }
  }

  return 0;
}


int ae::Server::listen()
{
  if (config::get.find("server") == config::get.end())
  {
    LOG(ERROR) << "Configuration is missing server section.";
    return -1;
  }
  auto server_config = config::get["server"];

  // create unix domain server socket
  if (server_config.find("ud_path") != server_config.end() &&
      server_config["ud_path"].is_string())
  {
    const std::string &ud_path = server_config["ud_path"];

    Socket *sock = new Socket(ud_path.data());
    if (sock == nullptr)
    {
      LOG(ERROR) << "Socket allocation error.";
      return -1;
    }
    if (sock->listen(5) < 0)
    {
      LOG(ERROR) << "Failed to listen on socket: " << *sock;
      return -1;
    }

    m_sockets.add_socket(std::shared_ptr<Socket>(sock));
    LOG(INFO) << "Listening on " << *sock;
  }

  // create inet server socket
  if (server_config.find("ip") != server_config.end() &&
      server_config["ip"].is_string() &&
      server_config.find("port") != server_config.end() &&
      server_config["port"].is_number_unsigned())
  {
    const std::string &ip = server_config["ip"];
    const int port = server_config["port"];

    Socket *sock = new Socket(ip.data(), port);
    if (sock == nullptr)
    {
      LOG(ERROR) << "Socket allocation error.";
      return -1;
    }
    if (sock->listen(5) < 0)
    {
      LOG(ERROR) << "Failed to listen on socket: " << *sock;
      return -1;
    }

    m_sockets.add_socket(std::shared_ptr<Socket>(sock));
    LOG(INFO) << "Listening on " << *sock;
  }

  return 0;
}


const ae::Server::interface_buffer_t ae::Server::get_read_buffer()
{
  std::lock_guard<std::mutex> lock(m_lock_read_buffer);
  return m_read_buffer;
}


void ae::Server::update_global_state(const std::vector<sAgentInterface> &agents)
{
  TIMED_FUNC(global_update_timer);

  std::lock_guard<std::mutex> lock_global_state(m_lock_global_state);

  uint64_t group = agents[0].id & (0xFFFFFFFF00000000);

  auto group_it = m_global_state.lower_bound(group);

  if (group_it == m_global_state.end())
  {
    for (const auto &agent : agents)
    {
      m_global_state.insert(m_global_state.end(), {agent.id, agent});
    }
  }
  else
  {
    for (auto it = agents.begin(); it != agents.end();)
    {
      while (group_it->first < it->id)
      {
        group_it = m_global_state.erase(group_it);
      }
      if (group_it->first == it->id)
      {
        group_it->second = *it;
        ++it;
        ++group_it;
      }
      else
      {
        group_it = ++m_global_state.insert(group_it, {it->id, *it});
        ++it;
      }
    }
  }

  update_read_buffer();
}


void ae::Server::expired_agent_check()
{
  TIMED_FUNC(expired_check_timer);

  std::lock_guard<std::mutex> lock_global_state(m_lock_global_state);
  time::agent_time_t current_time = time::timestamp();
  int erased_agent_count = 0;

  for (auto it = m_global_state.begin(); it != m_global_state.end();)
  {
    if (it->second.expires != 0 && current_time > it->second.expires)
    {
      it = m_global_state.erase(it);
      erased_agent_count += 1;
    }
    else
    {
      ++it;
    }
  }

  if (erased_agent_count != 0)
  {
    LOG(INFO) << "Found " << erased_agent_count << " expired agents.";
    update_read_buffer();
  }
}


void ae::Server::update_read_buffer()
{
  TIMED_FUNC(buffer_update_timer);

  std::vector<sAgentInterface> *read_buffer = new std::vector<sAgentInterface>();
  if (read_buffer == nullptr)
  {
    LOG(ERROR) << "Error while creating new read buffer.";
    return;
  }
  read_buffer->reserve(m_global_state.size());
  for (auto & agent : m_global_state)
  {
    read_buffer->push_back(agent.second);
  }
  m_lock_read_buffer.lock();
  m_read_buffer = interface_buffer_t(read_buffer);
  m_lock_read_buffer.unlock();
}


void ae::Server::request_handler(std::shared_ptr<ae::Socket> client)
{
  sCommunicationHeader header;

  if (client->recv(&header, sizeof(header)) != sizeof(header))
  {
    LOG(ERROR) << "Failed to receive header from client: " << *client;
    return;
  }

  switch (header.opcode)
  {
    case OPCODE_DISCONNECT:
      VLOG(3) << "OPCODE_DISCONNECT from client " << *client;
      client->close();
      break;

    case OPCODE_REQUEST_GROUP_ID:
      VLOG(3) << "OPCODE_REQUEST_GROUP_ID from client" << *client;
      request_group_id(client);
      break;

    case OPCODE_AGENT_SYNC_ALL:
      VLOG(3) << "OPCODE_AGENT_SYNC_ALL from " << *client;
      request_agent_sync_all(client, header);
      break;

    case OPCODE_AGENT_COMMIT:
      VLOG(3) << "OPCODE_AGENT_COMMIT from " << *client;
      request_agent_commit(client, header);
      break;

    default:
      LOG(WARNING) << "Opcode " << header.opcode << " is not supported. Closing connection to client " << *client;
      LOG(WARNING) << "Header(" << "session=" << header.session_id
                   << ", opcode=" << header.opcode
                   << ", group_id=" << header.agent_group_id
                   << ", agent_count=" << header.agent_count << ")";
      client->close();
      break;
  }

  // return socket to socket pool
  if (client->valid())
  {
    m_sockets.add_socket(client);
  }
}


void ae::Server::request_group_id(std::shared_ptr<Socket> client)
{
  sCommunicationHeader reply;
  reply.session_id = m_session_id;
  reply.opcode = OPCODE_SERVER_ACK;
  reply.agent_group_id = ++m_agent_group_counter;
  reply.agent_count = 0;

  client->send(&reply, sizeof(reply));
  VLOG(4) << "Assigned group id " << reply.agent_group_id << " to client " << *client;
}


void ae::Server::request_agent_sync_all(std::shared_ptr<Socket> client, sCommunicationHeader &header)
{
  TIMED_FUNC(sync_timer);

  const interface_buffer_t agents = get_read_buffer();
  sCommunicationHeader reply;
  reply.session_id = m_session_id;
  reply.opcode = OPCODE_SERVER_ACK;
  reply.agent_group_id = header.agent_group_id;
  reply.agent_count = agents->size();

  VLOG(4) << "Syncing " << reply.agent_count << " agents to client " << *client;
  if (client->send(&reply, sizeof(reply)) != sizeof(reply))
  {
    LOG(ERROR) << "Error while sending reply header.";
    client->close();
    return;
  }
  if (reply.agent_count > 0)
  {
    ssize_t data_len = reply.agent_count * sizeof(sAgentInterface);
    if (client->send(agents->data(), data_len) != data_len)
    {
      LOG(ERROR) << "Error while sending agent data.";
      client->close();
      return;
    }
  }
}


void ae::Server::request_agent_commit(std::shared_ptr<Socket> client, sCommunicationHeader &header)
{
  TIMED_FUNC(commit_timer);

  sCommunicationHeader reply;
  reply.session_id = m_session_id;
  reply.opcode = OPCODE_SERVER_ACK;
  reply.agent_group_id = header.agent_group_id;
  reply.agent_count = header.agent_count;

  if (client->send(&reply, sizeof(reply)) != sizeof(reply))
  {
    LOG(ERROR) << "Error while sending reply header.";
    client->close();
    return;
  }

  VLOG(4) << "Commiting " << header.agent_count << " agents from client " << *client;
  if (header.agent_count > 0) {
    std::vector<sAgentInterface> client_agents;
    client_agents.resize(header.agent_count);

    ssize_t data_len = header.agent_count * sizeof(sAgentInterface);
    if (client->recv(client_agents.data(), data_len) != data_len)
    {
      LOG(ERROR) << "Error while receiving client agent data." << *client;
    }
    else
    {
      update_global_state(client_agents);
    }
  }
}
