#ifndef _BORDER_AGENT_H_
#define _BORDER_AGENT_H_

#include "../common/common.h"

class CBorderAgent: public CAgent
{
  private:
    class CVisualisation *visualisation;

  public:
    CBorderAgent(); 
    CBorderAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group = NULL,
                  unsigned long int group_id = 0);

    ~CBorderAgent();


    unsigned long int get_agent_type();
    void agent_process();

    virtual class CAgent* create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);
};



#endif
