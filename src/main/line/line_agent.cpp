#include "line_agent.h"


extern class CConfigure g_configure;

CLineAgent::CLineAgent()
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
}

CLineAgent::CLineAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  double pheromone_size = 4.0;
  this->agent_interface.body_type = AGENT_BODY_TYPE_BASIC;


  parameter = agent_group->get_agents_count()/120.0;

  phase = 0.0;

  this->agent_interface.robot_time = 0.0;
  this->agent_interface.position.x = 0.0;
  this->agent_interface.position.y = 0.0;
  this->agent_interface.position.z = 0.0;


  set_position();

  this->agent_interface.agent_type = AGENT_TYPE_DEFAULT;

  this->agent_interface.color.r = 1.0;
  this->agent_interface.color.g = 0.0;
  this->agent_interface.color.b = 0.0;

  agent_group->set_agent_struct(&this->agent_interface);
}

CLineAgent::~CLineAgent()
{

}



unsigned long int CLineAgent::get_agent_type()
{
  return AGENT_TYPE_NULL;
}

class CAgent* CLineAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CLineAgent(agent_interface, agent_group, group_id);
}

void CLineAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);

  agent_interface.robot_time = get_ms_time();


  phase+= 0.0001*agent_interface.dt;

  set_position();



  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_tx;
  (void)res_rx;
}


void CLineAgent::set_position()
{
  this->agent_interface.position.x = 0.6*g_configure.get_width_cm()*0.5*(sin(1.0*parameter + cos(phase)));
  this->agent_interface.position.y = 0.6*g_configure.get_height_cm()*0.5*(sin(2.0*parameter+ cos(phase)));
  this->agent_interface.position.z = 0.0;
}
