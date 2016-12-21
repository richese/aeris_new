#ifndef _AGENT_H_
#define _AGENT_H_


#include "agent_interface.h"
#include "../ms_time.h"

class CAgent: public CAgentInterface
{
  protected:
    unsigned int state;
    float dx, dy, dz;
    float droll, dpitch, dyaw;

  public:
    CAgent();
    CAgent( struct sAgentInterface agent_interface,
            class CAgentGroup *agent_group = NULL,
            unsigned long int group_id = 0
          );

    virtual ~CAgent();
    void init();
    virtual void agent_process();
    virtual unsigned long int get_agent_type();

    virtual class CAgent* create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id);

    int get_agent_mode(class CAgentGroup *agent_group = NULL);
};



#endif
