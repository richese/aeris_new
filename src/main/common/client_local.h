#ifndef _CLIENT_LOCAL_H_
#define _CLIENT_LOCAL_H_


#include <agent_group.h>
#include <visualisation.h>

class CClientLocal:public CAgentGroup
{
  private:
    class CVisualisation *visualisation;

  public:
    CClientLocal(struct sAgentGroupInitStruct agent_group_init_struct);
    ~CClientLocal();

    int main();
    int connect();
};


#endif
