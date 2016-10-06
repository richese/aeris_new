#ifndef _CLIENT_H_
#define _CLIENT_H_


#include "agent_group.h"
#include "visualisation/visualisation.h"

#include <sys/socket.h>
#include <netinet/in.h>

#define CLIENT_CONNECTION_STATE_NO_CONNECTED    ((unsigned int)0)
#define CLIENT_CONNECTION_STATE_CONNECTED       ((unsigned int)1)

class CClient:public CAgentGroup
{
  private:
    class CVisualisation *visualisation;


    unsigned int connection_state;
    int sockfd;
    struct sockaddr_in serv_addr;

  public:
    CClient(struct sAgentGroupInitStruct agent_group_init_struct, class CAgent *agent);
    ~CClient();

    int main();
    int connect_to_server();


};


#endif
