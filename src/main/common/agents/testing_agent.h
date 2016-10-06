#ifndef _TESTING_AGENT_H_
#define _TESTING_AGENT_H_

#include "agent.h"
#include "../agent_group.h"

class CTestingAgent: public CAgent
{
  public:
    CTestingAgent();
    CTestingAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group = NULL,
                  unsigned long int group_id = 0);

    ~CTestingAgent();


    unsigned long int get_agent_type();

    virtual class CAgent* clone(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);
};


#endif
