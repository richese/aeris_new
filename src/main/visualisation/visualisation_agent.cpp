#include "visualisation_agent.h"


CVisualisationAgent::CVisualisationAgent()
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
}

CVisualisationAgent::CVisualisationAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
  agent_group->set_agent_struct(&this->agent_interface);
}

CVisualisationAgent::~CVisualisationAgent()
{

}



unsigned long int CVisualisationAgent::get_agent_type()
{
  return AGENT_TYPE_NULL;
}

class CAgent* CVisualisationAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CVisualisationAgent(agent_interface, agent_group, group_id);
}

void CVisualisationAgent::agent_process()
{
  agent_interface.robot_time = get_ms_time();
}
