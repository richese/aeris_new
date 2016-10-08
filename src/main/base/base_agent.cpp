#include "base_agent.h"
#include <stdio.h>


extern class CConfigure g_configure;

CBaseAgent::CBaseAgent()
{

}

CBaseAgent::CBaseAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_BASE;


  this->agent_interface.position.x = 0.4*g_configure.get_width_cm()/2.0;
  this->agent_interface.position.y = 0.4*g_configure.get_width_cm()/2.0;
  this->agent_interface.position.z = 1.1;

  /*
  this->agent_interface.position.x = 0.0;
  this->agent_interface.position.y = 0.0;
  this->agent_interface.position.z = 2.0;
  */

  this->agent_interface.color.r = 0.0;
  this->agent_interface.color.g = 1.0;
  this->agent_interface.color.b = 0.0;

  this->agent_interface.agent_type = AGENT_TYPE_BASE;

  agent_group->set_agent_struct(&this->agent_interface);
}

CBaseAgent::~CBaseAgent()
{

}

unsigned long int CBaseAgent::get_agent_type()
{
  return AGENT_TYPE_TESTING;
}

class CAgent* CBaseAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CBaseAgent(agent_interface, agent_group, group_id);
}


void CBaseAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);
  agent_interface.robot_time = get_ms_time();

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  #ifdef _DEBUG_COMMON_
  printf("%lu : processing agent with %lu id %i %i\n", (unsigned long int)this, agent_interface.id, res_rx, res_tx);
  #endif

  (void)res_rx;
  (void)res_tx;
}
