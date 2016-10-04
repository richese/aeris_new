#ifndef _AGENT_INTERFACE_H_
#define _AGENT_INTERFACE_H_

#include <agent_body.h>
#include <point3d.h>
#include <stdlib.h>

struct sAgentInterface
{
  unsigned int agent_type, body_type, state, id, body_id;
  double robot_time, dt;
  struct sAgentPosition position;
};


#define AGENT_TYPE_NULL     ((unsigned int)0)


class CAgentGroup;

class CAgentInterface:public CAgentBody
{
  protected:
    struct sAgentInterface agent_interface;
    class CAgentGroup *agent_group;

    unsigned int serialized_size;
    char *serialized;

  public:
    CAgentInterface(struct sAgentInterface agent_interface,
                    class CAgentGroup *agent_group = NULL);
    ~CAgentInterface();

    unsigned int get_id();

  protected:

    char *get_serialized();
    unsigned int get_serialized_size();
    void set_serialized(char *b, unsigned int size);
};

#endif
