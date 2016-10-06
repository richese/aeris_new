#ifndef _VISUALISATION_AGENT_H_
#define _VISUALISATION_AGENT_H_

#include "../common/common.h"

class CVisualisationAgent: public CAgent
{
  private:
    class CVisualisation *visualisation;
    
  public:
    CVisualisationAgent();
    CVisualisationAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group = NULL,
                  unsigned long int group_id = 0);

    ~CVisualisationAgent();


    unsigned long int get_agent_type();
    void agent_process();

    virtual class CAgent* clone(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);
};



#endif
