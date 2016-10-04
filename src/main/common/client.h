#ifndef _CLIENT_H_
#define _CLIENT_H_


#include <agent_group.h>
#include <visualisation.h>


#define CLIENT_CONNECTION_STATE_NO_CONNECTED    ((unsigned int)0)
#define CLIENT_CONNECTION_STATE_CONNECTED       ((unsigned int)1)

class CClient:public CAgentGroup
{
  private:
    class CVisualisation *visualisation;

    unsigned int connection_state;

  public:
    CClient(struct sAgentGroupInitStruct agent_group_init_struct);
    ~CClient();

    int main();
    int connect();


};


#endif
