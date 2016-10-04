#ifndef _AGENT_INTERFACE_H_
#define _AGENT_INTERFACE_H_

#include <point3d.h>
#include <stdlib.h>

struct sAgentInterface
{
  struct sAgentPosition position;
  struct sAgentBody body;

  unsigned int agent_type, body_type, state, id;
  double robot_time, dt;
};


#define AGENT_TYPE_NULL     ((unsigned int)0)


#define AGENT_BODY_TYPE_CUSTOM  ((unsigned int)0)
#define AGENT_BODY_TYPE_RANDOM  ((unsigned int)1)

class CAgentGroup;

class CAgentInterface
{
  protected:
    struct sAgentInterface agent_interface;
    class CAgentGroup *agent_group;

  public:
    CAgentInterface(struct sAgentInterface agent_interface,
                    class CAgentGroup *agent_group = NULL);
    ~CAgentInterface();

    unsigned int get_id();

  protected:
    void random_body();
};



#endif
