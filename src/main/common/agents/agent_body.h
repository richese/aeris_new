#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include "../point3d.h"


#define AGENT_BODY_TYPE_NULL              ((unsigned int)0)
#define AGENT_BODY_TYPE_BORDER            ((unsigned int)1)
#define AGENT_BODY_TYPE_BASIC             ((unsigned int)2)
#define AGENT_BODY_TYPE_BASIC_SMALL       ((unsigned int)3)
#define AGENT_BODY_TYPE_ABSTRACT          ((unsigned int)4)
#define AGENT_BODY_TYPE_PHEROMONE         ((unsigned int)5)
#define AGENT_BODY_TYPE_PHEROMONE_SMALL   ((unsigned int)6)
#define AGENT_BODY_TYPE_SUMO_ARENA        ((unsigned int)7)
#define AGENT_BODY_TYPE_RANDOM            ((unsigned int)8)

#define AGENT_BODY_TYPE_COUNT             ((unsigned int)9)


class CAgentBody
{
  private:
    unsigned int rand_value;

  public:
    std::vector<struct sPolygone> body_polygons;
    std::vector< struct sPoint > vertices;


  public:
    CAgentBody();
    CAgentBody(unsigned int body_type);
    ~CAgentBody();

  private:
    void agent_body_null();
    void agent_body_square();
    void agent_body_random();

  private:
    void obj_load(char* body_filename, float scale);
    bool load_from_file(char * path, float scale);
    unsigned int agent_body_rand();
    double agent_body_rnd();
};

#endif
