#include "example_agent.h"
#include "../math_robot.h"
#include "../configure.h"

#include <stdio.h>


extern class CConfigure g_configure;

CExampleAgent::CExampleAgent()
{

}

CExampleAgent::CExampleAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_ABSTRACT;

  this->agent_interface.position.x = m_abs(m_rnd())*g_configure.get_width_cm();
  this->agent_interface.position.y = m_abs(m_rnd())*g_configure.get_height_cm();
  this->agent_interface.position.z = 0.0*m_abs(m_rnd())*g_configure.get_depth_cm();

  this->agent_interface.color.r = m_abs(m_rnd());
  this->agent_interface.color.g = m_abs(m_rnd());
  this->agent_interface.color.b = m_abs(m_rnd());

  agent_group->set_agent_struct(&this->agent_interface);

  printf("example agent created \n");
}

CExampleAgent::~CExampleAgent()
{

}

unsigned long int CExampleAgent::get_agent_type()
{
  return AGENT_TYPE_TESTING;
}

class CAgent* CExampleAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CExampleAgent(agent_interface, agent_group, group_id);
}


void CExampleAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);
  agent_interface.robot_time = get_ms_time();

  if ((rand()%100) < 2)
  {
    double dt = 0.1*agent_interface.dt;

    dx = 0.03*m_rnd()*dt;
    dy = 0.03*m_rnd()*dt;
    // dz = 0.03*m_rnd()*dt;


    droll = m_rnd()*dt;
    dpitch = m_rnd()*dt;
    dyaw = m_rnd()*dt;

    switch (rand()%2)
    {
      case 0: agent_interface.body_type = AGENT_BODY_TYPE_BASIC; break;
      case 1: agent_interface.body_type = AGENT_BODY_TYPE_ABSTRACT; break;
    }
  }

  agent_interface.position.x+= dx;
  agent_interface.position.y+= dy;
  agent_interface.position.z+= dz;

  agent_interface.position.roll+= droll;
  agent_interface.position.pitch+= dpitch;
  agent_interface.position.yaw+= dyaw;


  agent_interface.position.x = m_saturate(-g_configure.get_width_cm(), g_configure.get_width_cm(), agent_interface.position.x);
  agent_interface.position.y = m_saturate(-g_configure.get_height_cm(), g_configure.get_height_cm(), agent_interface.position.y);
  agent_interface.position.z = m_saturate(-g_configure.get_depth_cm(), g_configure.get_depth_cm(), agent_interface.position.z);

  //process AI here

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  #ifdef _DEBUG_COMMON_
  printf("%lu : processing agent with %lu id %i %i\n", (unsigned long int)this, agent_interface.id, res_rx, res_tx);
  #endif

  (void)res_rx;
  (void)res_tx;
}
