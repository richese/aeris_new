#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include "../point3d.h"

#define AGENT_BODY_TYPE_NULL      ((unsigned int)0)
#define AGENT_BODY_TYPE_SQUARE    ((unsigned int)1)
#define AGENT_BODY_TYPE_RANDOM    ((unsigned int)2)
#define AGENT_BODY_TYPE_CUSTOM    ((unsigned int)3)

#define AGENT_BODY_TYPE_COUNT     ((unsigned int)4)


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
    void obj_load(char* body_filename);
    bool load_from_file(char * path);
    unsigned int agent_body_rand();
    double agent_body_rnd();
};

#endif
