#ifndef _AGENT_H_
#define _AGENT_H_


#include <agent_interface.h>
#include <agent_group.h>


class CAgent: public CAgentInterface
{
  protected:
    unsigned int state;
    float dx, dy, dz;
    float droll, dpitch, dyaw;

  public:
    CAgent( struct sAgentInterface agent_interface,
            class CAgentGroup *agent_group = NULL
          );


    virtual ~CAgent();
    virtual void agent_process();
};


#endif
