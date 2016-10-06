#ifndef _AGENT_INTERFACE_H_
#define _AGENT_INTERFACE_H_

#include "agent_body.h"
#include "../point3d.h"
#include <stdlib.h>

struct sAgentInterface
{
  unsigned long int id, group_id;
  unsigned int agent_type, body_type, state, body_id;
  double fitness;
  double robot_time, dt, agent_intensity;
  struct sAgentPosition position;
};


#define AGENT_TYPE_NULL     ((unsigned long int)0)
#define AGENT_TYPE_DEFAULT  ((unsigned long int)1)
#define AGENT_TYPE_TESTING  ((unsigned long int)2)



class CAgentGroup;
class CAgentInterface:public CAgentBody
{
  protected:
    struct sAgentInterface agent_interface;
    class CAgentGroup *agent_group;


  public:
    CAgentInterface();
    CAgentInterface(struct sAgentInterface agent_interface,
                    class CAgentGroup *agent_group = NULL,
                    unsigned long int group_id = 0);
    ~CAgentInterface();

    unsigned int get_id();

  protected:
    unsigned int get_serialized_size();
    void set_serialized(char *b, unsigned int size);
};

#endif
