#include <cstdint>

#include <memory>
#include <vector>

#include "agent.h"
#include "config.h"
#include "socket.h"
#include "communication_header.h"

#include "agent_client.h"


ae::Client::Client() :
  m_socket(nullptr),
  m_session_id(0),
  m_group_id(0)
{

}


ae::Client::~Client()
{

}


int64_t ae::Client::opRequestGroupId()
{
  if (opConnect() < 0)
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
  return m_group_id;
}


int ae::Client::opDisconnect()
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


std::vector<ae::AgentInterface>* ae::Client::opAgentSyncAll()
{
  TIMED_FUNC(net_sync_timer);

  if (opConnect() < 0)
  {
    return nullptr;
  }

  sCommunicationHeader header;
  header.session_id = m_session_id;
  header.opcode = OPCODE_AGENT_SYNC_ALL;
  header.agent_group_id = m_group_id;
  header.agent_count = 0;

  if (m_socket->exchange(&header, sizeof(header)) != sizeof(header))
  {
    PLOG(ERROR) << "Failed header exchange: ";
    return nullptr;
  }

  if (header.opcode != OPCODE_SERVER_ACK)
  {
    LOG(ERROR) << "Invalid server reply opcode for OPCODE_AGENT_SYNC_ALL: " << header.opcode;
    return nullptr;
  }

  std::vector<AgentInterface>* synced_state = new std::vector<AgentInterface>();
  if (synced_state == nullptr)
  {
    PLOG(ERROR) << "Sync buffer allocation error.";
    return nullptr;
  }

  if (header.agent_count > 0)
  {
    synced_state->resize(header.agent_count);
    uint32_t len = header.agent_count * sizeof(AgentInterface);
    if (m_socket->recv(synced_state->data(), len) != len)
    {
      PLOG(ERROR) << "Sync data receive error: ";
      return nullptr;
    }
  }

  return synced_state;
}


int ae::Client::opAgentCommit(std::vector<AgentInterface> &agents)
{
  TIMED_FUNC(net_commit_timer);

  if (agents.size() == 0)
  {
    return 0;
  }

  if (opConnect() < 0)
  {
    return -1;
  }

  sCommunicationHeader header;
  header.session_id = m_session_id;
  header.opcode = OPCODE_AGENT_COMMIT;
  header.agent_group_id = m_group_id;
  header.agent_count = agents.size();

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
    uint32_t len = sizeof(AgentInterface) * header.agent_count;
    if (m_socket->send(agents.data(), len) != len)
    {
      PLOG(ERROR) << "Commit data send error: ";
      return -1;
    }
  }

  return 0;
}


int ae::Client::opConnect()
{
  TIMED_FUNC(client_disconnect_timer);

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
