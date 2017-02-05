#include <algorithm>
#include <future>
#include <iterator>
#include <vector>

#include "agent.h"
#include "agent_group.h"
#include "communication_header.h"
#include "config.h"
#include "logging.h"
#include "socket.h"
#include "signals.h"
#include "timing.h"


ae::AgentGroup::AgentGroup(std::chrono::milliseconds dt, uint32_t njobs) :
  m_group_id(0),
  m_agent_counter(0),
  m_dt(dt),
  m_njobs(njobs),
  m_running(false),
  m_global_state(nullptr),
  m_agents()
{
  m_global_state = new std::vector<sAgentInterface>();
}


ae::AgentGroup::~AgentGroup()
{
  if (m_global_state != nullptr)
  {
    delete m_global_state;
    m_global_state = nullptr;
  }

  for (Agent *agent : m_agents)
  {
    if (agent != nullptr)
    {
      delete agent;
      agent = nullptr;
    }
  }
}


uint64_t ae::AgentGroup::generate_agent_id()
{
  return (((uint64_t)m_group_id) << 32) | ++m_agent_counter;
}


void ae::AgentGroup::push_back(Agent *agent)
{
  if (m_running)
  {
    LOG(WARNING) << "Trying to add agent to running AgentGroup";
    return;
  }

  if (agent != nullptr)
  {
    m_agents.push_back(agent);
  }
}


int ae::AgentGroup::main()
{
  using std::chrono::duration_cast;

  m_running = true;
  VLOG(3) << "Starting AgentGroup main loop with " << m_agents.size() << " agents.";

  for (Agent *agent : m_agents)
  {
    agent->init(generate_agent_id());
  }

  if (commit() < 0)
  {
    LOG(ERROR) << "Failed on initial commit.";
    return -1;
  }

  auto next_update = time::clock::now() + m_dt;

  while (!signal::exit())
  {
    VLOG(4) << "AgentGroup main loop running.";

    if (sync() < 0)
    {
      return -1;
    }

    if (process() < 0)
    {
      return -1;
    }

    if (commit() < 0)
    {
      return -1;
    }

    auto time_left = next_update - time::clock::now();
    if (time_left.count() < 0)
    {
      LOG(WARNING) << "Main loop lagging by: [" << duration_cast<time::milliseconds>(time_left).count() << " ms]";
    }
    else
    {
      time::sleep_until(next_update);
    }
    next_update += m_dt;
  }

  VLOG(3) << "Exiting AgentGroup main loop.";
  m_running = false;
  return 0;
}


int ae::AgentGroup::sync()
{
  return 0;
}


int ae::AgentGroup::process()
{
  TIMED_FUNC(ae_process_timer);

  if (m_global_state == nullptr)
  {
    LOG(ERROR) << "Invalid global state.";
    return -1;
  }

  if (m_agents.size() == 0)
  {
    return 0;
  }

  if (m_njobs <= 1)
  {
    Environment *env = process_range(m_agents.begin(), m_agents.end());
    apply_agent_requests(*env);
    delete env;
  }
  else
  {
    std::vector<std::future<Environment*>> envs;
    auto part_size = (m_agents.size() / m_njobs) + 1;
    auto last = m_agents.begin();

    while(last != m_agents.end())
    {
      auto first = last;
      std::advance(last, part_size);
      envs.push_back(std::async(&AgentGroup::process_range, this, first, last));
    }
    for (auto &future : envs)
    {
      future.wait();
    }
    for (auto &future : envs)
    {
      Environment *env = future.get();
      apply_agent_requests(*env);
      delete env;
    }
  }

  return 0;
}


int ae::AgentGroup::commit()
{
  TIMED_FUNC(ag_commit_timer);

  if (m_global_state == nullptr)
  {
    LOG(ERROR) << "Invalid global state.";
    return -1;
  }

  m_global_state->resize(m_agents.size());

  auto it = m_global_state->begin();
  for (Agent *agent: m_agents)
  {
    // explicitne pretypovanie
    *it++ = static_cast<sAgentInterface>(*agent);
  }

  return 0;
}

// TODO: test this
void ae::AgentGroup::apply_agent_requests(Environment &env)
{
  for (Agent *agent : env.add_agent_requests())
  {
    if (agent != nullptr)
    {
      if (*agent == false) // agent nema priradene id
      {
        agent->init(generate_agent_id());
        m_agents.push_back(agent);
      }
      else // ak ma priradene id (co by nemal, lebo je to novy agent)
      {
        if (agent->group_id() == m_group_id)
        {
          bool safe_to_delete = true;
          for (const Agent *a : m_agents)
          {
            if (a == agent)
            {
              safe_to_delete = false;
              break;
            }
          }
          if (safe_to_delete)
          {
            delete agent;
          }
        }
        else // neni nas, prec s nim
        {
          delete agent;
        }
      }
    }
  }

  for (uint64_t id : env.del_agent_requests())
  {
    if ((id>>32) == m_group_id)
    {
      for (auto it = m_agents.begin(); it != m_agents.end(); ++it)
      {
        if (id == (*it)->id())
        {
          delete *it;
          *it = nullptr;
          it = m_agents.erase(it);
          break;
        }
      }
    }
  }
}


ae::Environment* ae::AgentGroup::process_range(agents_iter_t start, agents_iter_t end)
{
  Environment *env = new Environment(m_group_id, *m_global_state);

  for (auto it = start; it != end; ++it)
  {
    (*it)->process(*env);
  }

  return env;
}


ae::NetAgentGroup::NetAgentGroup(ae::time::milliseconds dt, uint32_t njobs) :
  AgentGroup(dt, njobs),
  m_socket(nullptr),
  m_session_id(0)
{

}


ae::NetAgentGroup::~NetAgentGroup()
{

}


int ae::NetAgentGroup::main()
{
  using std::chrono::duration_cast;

  m_running = true;
  VLOG(3) << "Starting NetAgentGroup main loop with " << m_agents.size() << " agents.";

  if (receive_agent_group_id() < 0)
  {
    LOG(ERROR) << "Failed to receive agent group id.";
    return -1;
  }

  for (Agent *agent : m_agents)
  {
    agent->init(generate_agent_id());
  }

  if (commit() < 0)
  {
    LOG(ERROR) << "Failed on initial commit.";
    return -1;
  }

  auto next_update = time::clock::now() + m_dt;

  while (!signal::exit())
  {
    VLOG(4) << "NetAgentGroup main loop running.";
    TIMED_SCOPE(main_scope, "main_loop");

    if (sync() < 0)
    {
      return -1;
    }

    if (process() < 0)
    {
      return -1;
    }

    if (commit() < 0)
    {
      return -1;
    }

    if (disconnect() < 0)
    {
      return -1;
    }

    PERFORMANCE_CHECKPOINT(main_scope);

    auto time_left = next_update - time::clock::now();
    if (time_left.count() < 0)
    {
      LOG(WARNING) << "Main loop lagging by: [" << duration_cast<time::milliseconds>(time_left).count() << " ms]";
    }
    else
    {
      time::sleep_until(next_update);
    }
    next_update += m_dt;
  }

  if (disconnect() < 0)
  {
    return -1;
  }

  VLOG(3) << "Exiting NetAgentGroup main loop.";
  m_running = false;
  return 0;
}


int ae::NetAgentGroup::receive_agent_group_id()
{
  if (connect() < 0)
  {
    return -1;
  }

  sCommunicationHeader header;
  header.session_id = 0;
  header.opcode = OPCODE_REQUEST_GROUP_ID;
  header.agent_group_id = 0;
  header.agent_count = 0;

  if (m_socket->exchange(&header, sizeof(header)) != sizeof(header))
  {
    PLOG(ERROR) << "Failed header exchange: ";
    return -1;
  }

  if (header.opcode != OPCODE_SERVER_ACK)
  {
    LOG(ERROR) << "Invalid server reply opcode for OPCODE_REQUEST_GROUP_ID: " << header.opcode;
    return -1;
  }
  m_session_id = header.session_id;
  m_group_id = header.agent_group_id;
  return 0;
}


int ae::NetAgentGroup::sync()
{
  TIMED_FUNC(net_sync_timer);

  if (connect() < 0)
  {
    return -1;
  }

  sCommunicationHeader header;
  header.session_id = m_session_id;
  header.opcode = OPCODE_AGENT_SYNC_ALL;
  header.agent_group_id = m_group_id;
  header.agent_count = 0;

  if (m_socket->exchange(&header, sizeof(header)) != sizeof(header))
  {
    PLOG(ERROR) << "Failed header exchange: ";
    return -1;
  }

  if (header.opcode != OPCODE_SERVER_ACK)
  {
    LOG(ERROR) << "Invalid server reply opcode for OPCODE_AGENT_SYNC_ALL: " << header.opcode;
    return -1;
  }

  std::vector<sAgentInterface> *synced_state = new std::vector<sAgentInterface>();
  if (synced_state == nullptr)
  {
    PLOG(ERROR) << "Sync buffer allocation error.";
    return -1;
  }

  if (header.agent_count > 0)
  {
    synced_state->resize(header.agent_count);
    uint32_t len = header.agent_count * sizeof(sAgentInterface);
    if (m_socket->recv(synced_state->data(), len) != len)
    {
      PLOG(ERROR) << "Sync data receive error: ";
      return -1;
    }
  }

  if (m_global_state != nullptr)
  {
    delete m_global_state;
  }
  m_global_state = synced_state;

  return 0;
}


int ae::NetAgentGroup::commit()
{
  TIMED_FUNC(net_commit_timer);

  if (connect() < 0)
  {
    return -1;
  }

  if (m_agents.size() == 0)
  {
    return 0;
  }

  std::vector<sAgentInterface> commit;
  commit.reserve(m_agents.size());
  for (auto &agent : m_agents)
  {
    commit.push_back(static_cast<sAgentInterface>(*agent));
  }

  sCommunicationHeader header;
  header.session_id = m_session_id;
  header.opcode = OPCODE_AGENT_COMMIT;
  header.agent_group_id = m_group_id;
  header.agent_count = commit.size();

  if (m_socket->exchange(&header, sizeof(header)) != sizeof(header))
  {
    PLOG(ERROR) << "Failed header exchange: ";
    return -1;
  }

  if (header.opcode != OPCODE_SERVER_ACK)
  {
    LOG(ERROR) << "Invalid server reply opcode for OPCODE_AGENT_COMMIT: " << header.opcode;
    return -1;
  }

  if (header.agent_count > 0)
  {
    uint32_t len = sizeof(sAgentInterface) * header.agent_count;
    if (m_socket->send(commit.data(), len) != len)
    {
      PLOG(ERROR) << "Commit data send error: ";
      return -1;
    }
  }

  return 0;
}


int ae::NetAgentGroup::connect()
{
  TIMED_FUNC(disconnect_timer);

  if (!m_socket)
  {
    if (config::get.find("server") == config::get.end())
    {
      LOG(ERROR) << "Configuration is missing server section.";
      return -1;
    }
    auto server_config = config::get["server"];

    // try to connect using unix socket
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
      m_socket = socket_ptr_t(sock);
    }
    else
    {
      //try to connect using inet socket
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
        m_socket = socket_ptr_t(sock);
      }
      else
      {
        LOG(ERROR) << "No valid server configuration found.";
        return -1;
      }
    }
  }

  if (!m_socket->valid())
  {
    // try to connect
    if (m_socket->connect() < 0)
    {
      LOG(ERROR) << "Failed to connect to server.";
      return -1;
    }
  }

  return 0;
}


int ae::NetAgentGroup::disconnect()
{
  if (!m_socket->valid())
  {
    // nothing to do
    return 0;
  }

  sCommunicationHeader header;
  header.session_id = m_session_id;
  header.opcode = OPCODE_DISCONNECT;
  header.agent_group_id = m_group_id;
  header.agent_count = 0;

  if (m_socket->send(&header, sizeof(header)) != sizeof(header))
  {
    LOG(ERROR) << "Failed to send disconnect request.";
    return -1;
  }

  m_socket->close();

  return 0;
}
