#include "agent_interface.h"

#include <stdio.h>
#include <string.h>

#include "../math_robot.h"
#include "../unique_id.h"
#include "../ms_time.h"
#include "../debug.h"

CAgentInterface::CAgentInterface()
{

}

CAgentInterface::CAgentInterface( struct sAgentInterface agent_interface,
                                  class CAgentGroup *agent_group, unsigned long int group_id):CAgentBody(agent_interface.body_id)
{
  this->agent_interface = agent_interface;
  this->agent_group = agent_group;

  this->agent_interface.fitness = 0.0;
  this->agent_interface.agent_intensity = 1.0;

  this->agent_interface.body_type = AGENT_BODY_TYPE_NULL;
  this->agent_interface.state = 0;
  this->agent_interface.id = get_unique_id();
  this->agent_interface.group_id = group_id;
  this->agent_interface.robot_time = get_ms_time();


  #ifdef _DEBUG_COMMON_
  printf("%lu : agent interface created\n", (unsigned long int)this);
  #endif
}


CAgentInterface::~CAgentInterface()
{

}

unsigned int CAgentInterface::get_id()
{
  return agent_interface.id;
}
