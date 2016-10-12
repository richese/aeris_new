#ifndef _CLIENT_H_
#define _CLIENT_H_


#include "agent_group.h"
#include "visualisation_dummy.h"

#include <sys/socket.h>
#include <netinet/in.h>

#define CLIENT_CONNECTION_STATE_NO_CONNECTED    ((unsigned int)0)
#define CLIENT_CONNECTION_STATE_CONNECTED       ((unsigned int)1)


class CClient:public CAgentGroup
{
  public:
    static const int USE_AF_UNIX = 0x01;
    static const int USE_AF_INET = 0x02;

  private:
    class CVisualisationDummy *visualisation;


    unsigned int connection_state;
    int connection_method;
    int sockfd;

  public:
    CClient(struct sAgentGroupInitStruct agent_group_init_struct, class CAgent *agent, class CVisualisationDummy *visualisation = NULL);
    ~CClient();

    void set_connection_method(int address_family);
    int main();
    int connect_to_server();

    int connect_to_unix_domain_server();
    int connect_to_inet_server();
};


#endif
