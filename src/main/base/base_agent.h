#ifndef _BASE_AGENT_H_
#define _BASE_AGENT_H_

#include "../common/common.h"

class CBaseAgent: public CAgent
{
  public:
    CBaseAgent();
    CBaseAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group = NULL,
                  unsigned long int group_id = 0);

    ~CBaseAgent();


    unsigned long int get_agent_type();

    void agent_process();

    virtual class CAgent* create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);
};


#endif
