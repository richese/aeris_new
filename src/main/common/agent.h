#ifndef _AGENT_H_
#define _AGENT_H_

#include <agent_input.h>
#include <agent_output.h>
#include <unique_id.h>
#include <math_robot.h>


struct sAgentInitStruct
{
  float dt;
  unsigned int agent_type;
  struct sPoint initial_position;
};


class CAgent: public CAgentInput, public CAgentOutput
{
  protected:
      struct sAgentInitStruct agent_init_struct;
      float life_time;
      unsigned int id;

  public:
    CAgent(struct sAgentInitStruct agent_init_struct);
    virtual ~CAgent();

    virtual void agent_process();
    virtual void init_body();
};


#endif
