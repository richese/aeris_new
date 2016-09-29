#include "agent.h"
#include "debug.h"


CAgent::CAgent(struct sAgentInitStruct agent_init_struct)
{
  this->agent_init_struct = agent_init_struct;
  this->life_time = 0.0;
  this->id = get_unique_id();

  init_body();

  #ifdef _DEBUG_COMMON_
  printf("%lu : agent created\n", (unsigned long int)this);
  #endif
}


CAgent::~CAgent()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : agent destroyed\n", (unsigned long int)this);
  #endif
}

void CAgent::agent_process()
{
  life_time+= agent_init_struct.dt;
}

void CAgent::init_body()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : agent init body called\n", (unsigned long int)this);
  #endif

  unsigned int j, i;

  float size = 0.01;

  unsigned polygons_count = 10;

  for (j = 0; j < polygons_count; j++)
  {
    struct sPolygone polygone;

    for (i = 0; i < 4; i++)
    {
      struct sPoint point;

      point.x = m_rnd()*size;
      point.y = m_rnd()*size;
      point.z = m_rnd()*size;
      polygone.points.push_back(point);
    }

    polygone.r = m_abs(m_rnd());
    polygone.g = m_abs(m_rnd());
    polygone.b = m_abs(m_rnd());


    polygons.polygons.push_back(polygone);
  }

}
