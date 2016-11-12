#ifndef _CLIENT_H_
#define _CLIENT_H_

#include <memory>

#include "socket.h"
#include "agent_group.h"
#include "visualisation_dummy.h"


#define CLIENT_CONNECTION_STATE_NO_CONNECTED    ((unsigned int)0)
#define CLIENT_CONNECTION_STATE_CONNECTED       ((unsigned int)1)


class CClient : public CAgentGroup
{
  private:

    enum ConnectionState {
      NOT_CONNECTED = 0,
      IS_CONNECTED  = 1
    };

    enum ConnectionMethod {
      METHOD_UNIX = 0x01,
      METHOD_INET = 0x02
    };

    CVisualisationDummy *visualisation;

    int connection_state;
    int connection_method;
    std::shared_ptr<Socket> socket;


  public:
    CClient(sAgentGroupInitStruct agent_group_init_struct,
            CAgent *agent,
            CVisualisationDummy *visualisation = NULL);
    ~CClient();

    void set_connection_method(int methods);
    int main();
    int connect_to_server();
};


#endif
