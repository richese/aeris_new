#ifndef _MODE_AGENT_H_
#define _MODE_AGENT_H_

#include "../common/common.h"



class CModeAgent: public CAgent
{
  private:
    std::vector<struct sModeResult> mode_result;

  public:
    CModeAgent();
    CModeAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group = NULL,
                  unsigned long int group_id = 0);

    ~CModeAgent();


    unsigned long int get_agent_type();

    void agent_process();

    virtual class CAgent* create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);
};


#endif
