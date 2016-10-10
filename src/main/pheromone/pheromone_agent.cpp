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
  double pheromone_size = 4.0;
  this->agent_interface.body_type = AGENT_BODY_TYPE_PHEROMONE;

  if (g_configure.get_cm_size() > 20.0)
  {
    this->agent_interface.body_type = AGENT_BODY_TYPE_PHEROMONE_SMALL;
    pheromone_size = 1.2;
  }

  this->agent_interface.position.x = -g_configure.get_width_cm()/2.0;
  this->agent_interface.position.y = -g_configure.get_height_cm()/2.0;
  this->agent_interface.position.z = 0.0;

  if (agent_group->get_agents_count() >= 2)
  {
    struct sAgentInterface agent_prev = agent_group->get_agent_struct_idx(agent_group->get_agents_count() - 2);

    this->agent_interface.position.x = agent_prev.position.x + pheromone_size;
    this->agent_interface.position.y = agent_prev.position.y;

    if (this->agent_interface.position.x > g_configure.get_width_cm()/2.0)
    {
      this->agent_interface.position.x = -g_configure.get_width_cm()/2.0;
      this->agent_interface.position.y = agent_prev.position.y + pheromone_size;
    }
  }

  this->agent_interface.agent_type = AGENT_TYPE_PHEROMONE;


  this->agent_interface.color.r = 0.0;
  this->agent_interface.color.g = 0.0;
  this->agent_interface.color.b = 0.0;

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

  double distance_min_blue = 1000000000.0;
  double distance_min_red = 1000000000.0;


  unsigned int j;
  double fitness_blue = 0.0;
  double fitness_red = 0.0;
  for (j = 0; j < agent_group->get_agents_count(); j++)
  {
    struct sAgentInterface agent_other = agent_group->get_agent_struct_idx(j);
    double dist = robot_distance(&agent_other.position, &agent_interface.position);


    if (agent_other.agent_type == AGENT_TYPE_ANT)
    {
      if (agent_other.state == 0)
      {
        if (dist < distance_min_blue)
        {
          distance_min_blue = dist;
          fitness_blue = agent_other.fitness;
        }
      }

      if (agent_other.state == 1)
      {
        if (dist < distance_min_red)
        {
          distance_min_red = dist;
          fitness_red = agent_other.fitness;
        }
      }
    }
  }


  double tau_red =  20000.0;
  double tau_blue = 10000.0;

  double k_red = 1.0 - agent_interface.dt/(agent_interface.dt+tau_red);
  double k_blue = 1.0 - agent_interface.dt/(agent_interface.dt+tau_blue);
  double trehsold = 1.0;


  double input_blue = 0.0;
  double input_red = 0.0;

  if (distance_min_blue < trehsold)
    input_blue = fitness_blue;

  if (distance_min_red < trehsold)
    input_red = fitness_red;



  agent_interface.color.r = k_red*agent_interface.color.r + (1.0-k_red)*input_red;
  agent_interface.color.g = 0.0;
  // agent_interface.color.b = k_blue*agent_interface.color.b + (1.0-k_blue)*input_blue;
  agent_interface.color.b = m_max(agent_interface.color.b, input_blue);

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_tx;
  (void)res_rx;
}
