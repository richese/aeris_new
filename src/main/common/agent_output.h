#ifndef _AGENT_OUTPUT_H_
#define _AGENT_OUTPUT_H_

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <vector>

#include <point3d.h>


struct sAgentPolygons
{
  std::vector<struct sPolygone> polygons;
};


struct sAgentOutput
{
  struct sAgentPosition position;
  unsigned int agent_type, id;
};

class CAgentOutput
{
  protected:
    float life_time;

    //positon of center of agent
    struct sAgentOutput output;

    //polygons points of agent
    struct sAgentPolygons polygons;

  public:
    CAgentOutput();
    virtual ~CAgentOutput();

    struct sAgentOutput *get_output();
    struct sAgentPolygons *get_polygons();

  protected:
    virtual void init_body();
};


#endif
