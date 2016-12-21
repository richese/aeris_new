#include "mode_agent.h"
#include <stdio.h>
#include "gui/gui.h"

extern class CConfigure g_configure;
extern class CGUI *gui;

CModeAgent::CModeAgent()
{

}

CModeAgent::CModeAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
  this->agent_interface.agent_type = AGENT_TYPE_MODE;
  this->agent_interface.state = 0;

  agent_group->set_agent_struct(&this->agent_interface);


  struct sModeResult tmp;

  tmp.state = AERIS_MODE_IDLE;
  tmp.mode_name = "idle";
  mode_result.push_back(tmp);

  tmp.state = AERIS_MODE_LINE_FOLLOWER;
  tmp.mode_name = "line follower";
  mode_result.push_back(tmp);

  tmp.state = AERIS_MODE_DYNAMIC_LINE_FOLLOWER;
  tmp.mode_name = "dynamic line follower";
  mode_result.push_back(tmp);

  tmp.state = AERIS_MODE_MAZE;
  tmp.mode_name = "maze";
  mode_result.push_back(tmp);

  tmp.state = AERIS_MODE_MINI_SUMO;
  tmp.mode_name = "mini sumo";
  mode_result.push_back(tmp);

  tmp.state = AERIS_MODE_DYNAMIC_LINE_FOLLOWER;
  tmp.mode_name = "ants colony";
  mode_result.push_back(tmp);

  gui->refresh(mode_result);


  printf("mode agent created \n");
}

CModeAgent::~CModeAgent()
{

}

unsigned long int CModeAgent::get_agent_type()
{
  return AGENT_TYPE_MODE;
}

class CAgent* CModeAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CModeAgent(agent_interface, agent_group, group_id);
}


void CModeAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);
  agent_interface.robot_time = get_ms_time();

  int mode = gui->get_mode();
  if (mode != -1)
    printf("SELECTED MODE \"%s\" %i\n", mode_result[mode].mode_name.c_str(), mode);

  if (mode == -1)
    this->agent_interface.state = AERIS_MODE_IDLE;
  else
    this->agent_interface.state = mode + 1;

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_rx;
  (void)res_tx;
}
