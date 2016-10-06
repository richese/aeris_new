#include "testing_agent.h"
#include <stdio.h>

CTestingAgent::CTestingAgent()
{

}

CTestingAgent::CTestingAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_CUSTOM;
  agent_group->set_agent_struct(&this->agent_interface);

  printf("testing agent created \n");
}

CTestingAgent::~CTestingAgent()
{

}



unsigned long int CTestingAgent::get_agent_type()
{
  return AGENT_TYPE_TESTING;
}

class CAgent* CTestingAgent::clone(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CTestingAgent(agent_interface, agent_group, group_id);
}
