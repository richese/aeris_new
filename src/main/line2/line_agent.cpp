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
  this->agent_interface.body_type = AGENT_BODY_TYPE_BASIC;


  t = 2.0 * 3.14159 * agent_group->get_agents_count() / kLineAgentCount;
  r = g_configure.get_height_cm() * 0.25;

  this->agent_interface.robot_time = 0.0;
  this->agent_interface.position.x = r * 2.1 * cos(t);
  this->agent_interface.position.y = r * sin(t);
  this->agent_interface.position.z = 0.0;

  init_x = this->agent_interface.position.x;
  init_y = this->agent_interface.position.y;
  t = 0;

  this->agent_interface.agent_type = AGENT_TYPE_DEFAULT;

  this->agent_interface.color.r = 1.0;
  this->agent_interface.color.g = 0.0;
  this->agent_interface.color.b = 0.0;

  agent_group->set_agent_struct(&this->agent_interface);

  // LOG(DEBUG) << "agent=" << agent_group->get_agents_count() << " x=" << this->agent_interface.position.x << " y=" << this->agent_interface.position.y;
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

  t += 0.05;
  agent_interface.position.y = init_y + sin(t + init_x / 6.0);



  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_tx;
  (void)res_rx;
}
