#include "food_agent.h"


extern class CConfigure g_configure;

CFoodAgent::CFoodAgent()
{

}

CFoodAgent::CFoodAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_TARGET;


  this->agent_interface.position.x = m_rnd()*g_configure.get_width_cm()/2.0;
  this->agent_interface.position.y = m_rnd()*g_configure.get_width_cm()/2.0;
  this->agent_interface.position.z = 1.1;


  /*
  this->agent_interface.position.x = m_abs(m_rnd())*g_configure.get_width_cm()/2.0;
  this->agent_interface.position.y = m_abs(m_rnd())*g_configure.get_height_cm()/2.0;
  this->agent_interface.position.z = 0.0*m_abs(m_rnd())*g_configure.get_depth_cm()/2.0;
  */

  this->agent_interface.color.r = 1.0;
  this->agent_interface.color.g = 1.0;
  this->agent_interface.color.b = 0.0;


  this->agent_interface.agent_type = AGENT_TYPE_TARGET;

  agent_group->set_agent_struct(&this->agent_interface);
}

CFoodAgent::~CFoodAgent()
{

}

unsigned long int CFoodAgent::get_agent_type()
{
  return AGENT_TYPE_TESTING;
}

class CAgent* CFoodAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CFoodAgent(agent_interface, agent_group, group_id);
}


void CFoodAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);
  agent_interface.robot_time = get_ms_time();


  if ((rand()%10000) < 5)
  {
    this->agent_interface.position.x = m_rnd()*g_configure.get_width_cm()/2.0;
    this->agent_interface.position.y = m_rnd()*g_configure.get_height_cm()/2.0;
  }

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  #ifdef _DEBUG_COMMON_
  printf("%lu : processing agent with %lu id %i %i\n", (unsigned long int)this, agent_interface.id, res_rx, res_tx);
  #endif

  (void)res_rx;
  (void)res_tx;
}
