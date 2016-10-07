#include "pheromone_agent.h"


extern class CConfigure g_configure;

CPheromoneAgent::CPheromoneAgent()
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
}

CPheromoneAgent::CPheromoneAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_PHEROMONE;

  this->agent_interface.position.x = -g_configure.get_width_cm();
  this->agent_interface.position.y = -g_configure.get_height_cm();
  this->agent_interface.position.z = 0.0;

  if (agent_group->get_agents_count() >= 2)
  {
    struct sAgentInterface agent_prev = agent_group->get_agent_struct_idx(agent_group->get_agents_count() - 2);

    this->agent_interface.position.x = agent_prev.position.x + 4.0;
    this->agent_interface.position.y = agent_prev.position.y;

    if (this->agent_interface.position.x > g_configure.get_width_cm())
    {
      this->agent_interface.position.x = -g_configure.get_width_cm();
      this->agent_interface.position.y = agent_prev.position.y + 4.0;
    }
  }


  this->agent_interface.color.r = 0.4;
  this->agent_interface.color.g = 0.4;
  this->agent_interface.color.b = 0.4;

  agent_group->set_agent_struct(&this->agent_interface);
}

CPheromoneAgent::~CPheromoneAgent()
{

}



unsigned long int CPheromoneAgent::get_agent_type()
{
  return AGENT_TYPE_NULL;
}

class CAgent* CPheromoneAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CPheromoneAgent(agent_interface, agent_group, group_id);
}

void CPheromoneAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);

  agent_interface.robot_time = get_ms_time();

  double distance_min_ant_1 = 1000000000.0;
  double distance_min_ant_2 = 1000000000.0;


  unsigned int j;
  for (j = 0; j < agent_group->get_agents_count(); j++)
  {
    struct sAgentInterface agent_other = agent_group->get_agent_struct_idx(j);
    double dist = robot_distance(&agent_other.position, &agent_interface.position);

    if (agent_other.body_type == AGENT_BODY_TYPE_BASIC)
    {
      if (dist < distance_min_ant_1)
        distance_min_ant_1 = dist;
    }

    if (agent_other.body_type == AGENT_BODY_TYPE_ABSTRACT)
    {
      if (dist < distance_min_ant_2)
        distance_min_ant_2 = dist;
    }
  }


  double k = 0.9;
  double trehsold = 3.0;

  if ((distance_min_ant_1 < trehsold) || (distance_min_ant_2 < trehsold))
  {
    if (distance_min_ant_1 < distance_min_ant_2)
    {
      agent_interface.color.r = 1.0;
      /*
      agent_interface.color.g = 0.0;
      agent_interface.color.b = 0.0;
      */
    }
    else
    {
      /*
      agent_interface.color.r = 0.0;
      agent_interface.color.g = 0.0;
      */
      agent_interface.color.b = 1.0;
    }
  }

  agent_interface.color.r = k*agent_interface.color.r;
  agent_interface.color.g = k*agent_interface.color.g;
  agent_interface.color.b = k*agent_interface.color.b;

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_tx;
  (void)res_rx;
}
