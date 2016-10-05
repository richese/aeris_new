#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include <point3d.h>
#include <glm/glm.hpp>

#define AGENT_BODY_TYPE_NULL    ((unsigned int)0)
#define AGENT_BODY_TYPE_SQUARE    ((unsigned int)1)
#define AGENT_BODY_TYPE_RANDOM  ((unsigned int)2)
#define AGENT_BODY_TYPE_CUSTOM  ((unsigned int)3)

#define AGENT_BODY_TYPE_COUNT   ((unsigned int)4)


class CAgentBody
{
  private:
    unsigned int rand_value;

  public:
    std::vector<struct sPolygone> body_polygons;
    std::vector< glm::vec3 > vertices;


  public:
    CAgentBody(unsigned int body_type);
    //CAgentBody(char* body_filename);
    ~CAgentBody();

  private:
    void agent_body_null();
    void agent_body_square();
    void agent_body_random();

  private:
    void obj_load(char* body_filename);
    bool load_from_file(  const char * path,
                          std::vector < glm::vec3 > & out_vertices
                        );
    unsigned int agent_body_rand();
    double agent_body_rnd();
};

#endif
