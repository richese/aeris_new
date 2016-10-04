#include <agent_interface.h>
#include <debug.h>

#include <math_robot.h>
#include <unique_id.h>
#include <ms_time.h>
#include <stdio.h>
#include <string.h>



CAgentInterface::CAgentInterface( struct sAgentInterface agent_interface,
                                  class CAgentGroup *agent_group)
{
  this->agent_interface = agent_interface;
  this->agent_group = agent_group;

  this->agent_interface.state = 0;
  this->agent_interface.id = get_unique_id();
  this->agent_interface.robot_time = get_ms_time();

  if (agent_interface.body_type == AGENT_BODY_TYPE_RANDOM)
  {
    random_body();
  }


  #ifdef _DEBUG_COMMON_
  printf("%lu : agent interface created\n", (unsigned long int)this);
  #endif
}


CAgentInterface::~CAgentInterface()
{
  if (serialized != NULL)
  {
    free(serialized);
    serialized = NULL;
    serialized_size = 0;
  }
}


void CAgentInterface::random_body()
{
    #ifdef _DEBUG_COMMON_
    printf("%lu : agent init body called\n", (unsigned long int)this);
    #endif

    unsigned int j, i;

    float size = 20.0*m_abs(m_rnd());

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


      agent_interface.body.polygons.push_back(polygone);
    }
}

unsigned int CAgentInterface::get_id()
{
  return agent_interface.id;
}
