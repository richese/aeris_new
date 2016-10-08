#ifndef _ANT_AGENT_H_
#define _ANT_AGENT_H_

#include "../common/common.h"

class CAntAgent: public CAgent
{
  private:
    std::vector<struct sColor> neighbour;
    unsigned int action;
    
  public:
    CAntAgent();
    CAntAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group = NULL,
                  unsigned long int group_id = 0);

    ~CAntAgent();


    unsigned long int get_agent_type();

    void agent_process();
    virtual class CAgent* create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);

  private:
    void get_neigbour_state();
};


#endif
