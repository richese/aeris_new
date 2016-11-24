#ifndef _PHEROMONE_AGENT_H_
#define _PHEROMONE_AGENT_H_

#include "../common/common.h"

class CLineAgent: public CAgent
{
  public:
    static const int kLineAgentCount = 400;
  private:
    class CVisualisation *visualisation;

    float t, r, init_x, init_y;
  public:
    CLineAgent();
    CLineAgent(struct sAgentInterface agent_interface,
               class CAgentGroup *agent_group = NULL,
               unsigned long int group_id = 0);

    ~CLineAgent();


    unsigned long int get_agent_type();
    void agent_process();

    virtual class CAgent* create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);

  private:
    void set_position();
};



#endif
