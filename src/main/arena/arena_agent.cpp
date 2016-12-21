#include "arena_agent.h"


CArenaAgent::CArenaAgent()
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
}

CArenaAgent::CArenaAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_SUMO_ARENA;

  this->agent_interface.position.x = 0.0;
  this->agent_interface.position.y = 0.0;
  this->agent_interface.position.z = 0.0;

  this->agent_interface.color.r = 1.0;
  this->agent_interface.color.g = 1.0;
  this->agent_interface.color.b = 0.0;

  agent_group->set_agent_struct(&this->agent_interface);
}

CArenaAgent::~CArenaAgent()
{

}



unsigned long int CArenaAgent::get_agent_type()
{
  return AGENT_TYPE_NULL;
}

class CAgent* CArenaAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CArenaAgent(agent_interface, agent_group, group_id);
}

void CArenaAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);

  agent_interface.robot_time = get_ms_time();

  int mode = get_agent_mode(agent_group);


  //check if dafault or sumo mode selected
  if ((mode == AERIS_MODE_NULL) || (mode == AERIS_MODE_MINI_SUMO))
  {
    agent_interface.body_type = AGENT_BODY_TYPE_SUMO_ARENA;
  }
  else
  {
    //do nothing -> different mode selected
    agent_interface.body_type = AGENT_BODY_TYPE_NULL;
  }


  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_tx;
  (void)res_rx;
}
