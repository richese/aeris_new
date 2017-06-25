#ifndef _AGENT_CLIENT_H_
#define _AGENT_CLIENT_H_

#include <cstdint>

#include <memory>
#include <vector>

#include "agent.h"
#include "socket.h"


namespace ae
{


class Client
{
  using socket_ptr_t = std::unique_ptr<Socket>;

  public:
    Client();
    ~Client();

    int64_t opRequestGroupId();
    int opDisconnect();
    std::vector<AgentInterface>* opAgentSyncAll();
    int opAgentCommit(std::vector<AgentInterface> &agents);

  private:

    int opConnect();

    socket_ptr_t m_socket;
    uint32_t m_session_id;
    uint32_t m_group_id;
};



} /* namespace ae */

#endif /* _AGENT_CLIENT_H_ */
