#include <agent_body.h>
#include <math_robot.h>

CAgentBody::CAgentBody(unsigned int body_type)
{
  rand_value = 0;
  switch(body_type)
  {
    case AGENT_BODY_TYPE_NULL: agent_body_null(); break;
    case AGENT_BODY_TYPE_SQUARE: agent_body_square(); break;
    case AGENT_BODY_TYPE_RANDOM: agent_body_random(); break;
  }
}

CAgentBody::~CAgentBody()
{

}

void CAgentBody::agent_body_null()
{

}

void CAgentBody::agent_body_square()
{

}


void CAgentBody::agent_body_random()
{
  unsigned int j, i;

  float size = 5.0*m_abs(agent_body_rnd());

  unsigned polygons_count = 10;

  for (j = 0; j < polygons_count; j++)
  {
    struct sPolygone polygone;
    for (i = 0; i < 4; i++)
    {
      struct sPoint point;

      point.x = agent_body_rnd()*size;
      point.y = agent_body_rnd()*size;
      point.z = agent_body_rnd()*size;
      polygone.points.push_back(point);
    }

    polygone.r = m_abs(agent_body_rnd());
    polygone.g = m_abs(agent_body_rnd());
    polygone.b = m_abs(agent_body_rnd());


    body_polygons.push_back(polygone);
  }
}

unsigned int CAgentBody::agent_body_rand()
{
  rand_value = rand_value *(unsigned int)1103515245 + (unsigned int)12345;
  return rand_value;
}

double CAgentBody::agent_body_rnd()
{
  return (agent_body_rand()%200000000)/100000000.0 - 1.0;
}
