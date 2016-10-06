#include "agent.h"
#include "abstract_agent.h"

#include "../math_robot.h"
#include "../configure.h"
#include "../debug.h"

#include "../agent_group.h"


extern class CConfigure g_configure;

CAgent::CAgent()
{

}

CAgent::CAgent( struct sAgentInterface agent_interface,
                class CAgentGroup *agent_group,
                unsigned long int group_id
              ):CAgentInterface(agent_interface, agent_group, group_id)
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : agent created\n", (unsigned long int)this);
  #endif


  this->agent_interface.agent_type = get_agent_type();
  this->agent_interface.body_type = AGENT_BODY_TYPE_RANDOM;


  agent_group->set_agent_struct(&this->agent_interface);
  dx = 0.0;
  dy = 0.0;
  dz = 0.0;

  droll = 0.0;
  dpitch = 0.0;
  dyaw = 0.0;
}


CAgent::~CAgent()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : agent destroyed\n", (unsigned long int)this);
  #endif
}

class CAgent* CAgent::clone(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CAgent(agent_interface, agent_group, group_id);
}

unsigned long int CAgent::get_agent_type()
{
  return AGENT_TYPE_DEFAULT;
}


void CAgent::agent_process()
{
  
}
