#ifndef _AGENT_INTERFACE_H_
#define _AGENT_INTERFACE_H_

#include <point3d.h>
#include <stdlib.h>

struct sAgentInterface
{
  unsigned int agent_type, body_type, state, id;
  double robot_time, dt;
  
  struct sAgentPosition position;
  struct sAgentBody body;



  template<typename Archive>
  void serialize(Archive& ar, const unsigned version)
  {
    ar & position & body & agent_type & body_type & state & id & robot_time & dt;
    (void)version;
  }
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

    unsigned int serialized_size;
    char *serialized;

  public:
    CAgentInterface(struct sAgentInterface agent_interface,
                    class CAgentGroup *agent_group = NULL);
    ~CAgentInterface();

    unsigned int get_id();

  protected:
    void random_body();



    char *get_serialized();
    unsigned int get_serialized_size();
    void set_serialized(char *b, unsigned int size);
};



#endif
