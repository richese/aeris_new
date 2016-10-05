#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include <point3d.h>


#define AGENT_BODY_TYPE_NULL    ((unsigned int)0)
#define AGENT_BODY_TYPE_SQUARE    ((unsigned int)1)
#define AGENT_BODY_TYPE_RANDOM  ((unsigned int)2)

#define AGENT_BODY_TYPE_COUNT   ((unsigned int)3)


class CAgentBody
{
  private:
    unsigned int rand_value;

  public:
    std::vector<struct sPolygone> body_polygons;

  public:
    CAgentBody(unsigned int body_type);
    CAgentBody(char* body_filename);
    ~CAgentBody();

  private:
    void agent_body_null();
    void agent_body_square();
    void agent_body_random();

  private:
    unsigned int agent_body_rand();
    double agent_body_rnd();
};

#endif
