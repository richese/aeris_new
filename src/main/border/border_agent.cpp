#include "border_agent.h"


CBorderAgent::CBorderAgent()
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
}

CBorderAgent::CBorderAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_BORDER;

  this->agent_interface.position.x = 0.0;
  this->agent_interface.position.y = 0.0;
  this->agent_interface.position.z = 0.0;

  this->agent_interface.color.r = 1.0;
  this->agent_interface.color.g = 1.0;
  this->agent_interface.color.b = 1.0;


  agent_group->set_agent_struct(&this->agent_interface);
}

CBorderAgent::~CBorderAgent()
{

}

unsigned long int CBorderAgent::get_agent_type()
{
  return AGENT_TYPE_NULL;
}

class CAgent* CBorderAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CBorderAgent(agent_interface, agent_group, group_id);
}

void CBorderAgent::agent_process()
{
  agent_interface.robot_time = get_ms_time();
}
