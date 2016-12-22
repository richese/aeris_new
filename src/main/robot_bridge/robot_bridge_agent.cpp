#include "robot_bridge_agent.h"
#include <stdio.h>
#include "gui/gui.h"

extern class CConfigure g_configure;
extern class CGUI *gui; 

extern class CBridgeInterface *bridge_interface;
extern void BridgeResult_Init(struct sBridgeResult *result);

CRobotBridgeAgent::CRobotBridgeAgent()
{

}

CRobotBridgeAgent::CRobotBridgeAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
  this->agent_interface.agent_type = AGENT_TYPE_MODE;
  this->agent_interface.state = 0;

  agent_group->set_agent_struct(&this->agent_interface);


  struct sBridgeResult tmp;

  unsigned int i;
  for (i = 0; i < 1000; i++)
  {
    BridgeResult_Init(&tmp);

    tmp.id = rand();
    bridge_interface->set_by_id(tmp.id, tmp);
  }

  gui->refresh();

  printf("bridge agent created \n");
}

CRobotBridgeAgent::~CRobotBridgeAgent()
{

}

unsigned long int CRobotBridgeAgent::get_agent_type()
{
  return AGENT_TYPE_MODE;
}

class CAgent* CRobotBridgeAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CRobotBridgeAgent(agent_interface, agent_group, group_id);
}


void CRobotBridgeAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);
  agent_interface.robot_time = get_ms_time();

  unsigned int i;
  for (i = 0; i < bridge_interface->size(); i++)
  {
    struct sBridgeResult tmp;

    tmp = bridge_interface->get(i);

    tmp.type = rand();
    tmp.state = rand();
    tmp.action = rand();
    tmp.fitness = (rand()%1000000)/1000000.0;
    tmp.uptime++;

    tmp.roll+= 0.1;
    tmp.pitch+= 0.2;
    tmp.yaw+= 0.3;

    bridge_interface->set(i, tmp);
  }

  gui->robot_values_refresh();
  Fl::awake();

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_rx;
  (void)res_tx;
}
