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

  /*
  struct sBridgeResult tmp;

  unsigned int i;
  for (i = 0; i < 30; i++)
  {
    BridgeResult_Init(&tmp, true);

    tmp.id = rand();
    bridge_interface->set_by_id(tmp.id, tmp);
  }

  */

  gui->redraw();

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


  unsigned int j;



  for (j = 0; j < agent_group->get_agents_count(); j++)
  {
    struct sAgentInterface agent_other = agent_group->get_agent_struct_idx(j);

    struct sBridgeResult tmp;
    BridgeResult_Init(&tmp, false);

    tmp.id = agent_other.id;
    tmp.type = agent_other.agent_type;
    tmp.state = agent_other.state;
    tmp.fitness = agent_other.fitness;
    tmp.uptime = agent_other.robot_time;
    tmp.time = get_ms_time();

    tmp.x = agent_other.position.x;
    tmp.y = agent_other.position.y;
    tmp.z = agent_other.position.z;

    tmp.roll = agent_other.position.roll;
    tmp.pitch = agent_other.position.pitch;
    tmp.yaw = agent_other.position.yaw;

    bridge_interface->set_by_id(tmp.id, tmp);
  }

  printf("\n\n >>>>>>>>>>>>> %u %i\n\n", agent_group->get_agents_count(), bridge_interface->size());


/*
  unsigned int i;
  for (i = 0; i < bridge_interface->size(); i++)
  {
    struct sBridgeResult tmp;

    tmp = bridge_interface->get(i);

    tmp.type = rand();
    tmp.state = rand();
    tmp.action = rand();
    tmp.fitness = ((rand()%1000000)/1000000.0 - 0.5)*2.0;
    tmp.uptime++;
    tmp.time = get_ms_time();

    tmp.roll+= 5.7;
    tmp.pitch+= 5.0;
    tmp.yaw+= 5.3;

    float t = 30.0*(tmp.uptime%360)/360.0;
    tmp.x = sin(t);
    tmp.y = cos(t);
    tmp.z = sin(4.0*cos(t));

    bridge_interface->set(i, tmp);

    bridge_interface->add_to_log(i);
  }
*/

  gui->redraw();

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  (void)res_rx;
  (void)res_tx;
}
