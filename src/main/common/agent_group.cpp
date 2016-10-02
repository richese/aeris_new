#include "agent_group.h"
#include "debug.h"

#include <math_robot.h>
#include <getch.h>

#include <thread>
#include <chrono>
#include <unistd.h>

CAgentGroup::CAgentGroup(struct sAgentInitStruct agent_init_struct, struct sAgentGroupInitStruct agent_group_init_struct)
{
  unsigned int i;

  this->agent_group_init_struct = agent_group_init_struct;
  this->agent_init_struct = agent_init_struct;

  for (i = 0; i < agent_group_init_struct.count; i++)
  {
    if (agent_group_init_struct.random_positions == true)
    {
      agent_init_struct.initial_position.x = m_rnd();
      agent_init_struct.initial_position.y = m_rnd();
      agent_init_struct.initial_position.z = 0.0*m_rnd();
    }

    agents.push_back(new CAgent(agent_init_struct));
  }

  #ifdef _DEBUG_COMMON_
  printf("%lu : agent group created\n", (unsigned long int)this);
  #endif

  rt_timer_set_period(50.0);
}

CAgentGroup::CAgentGroup(struct sAgentInitStruct agent_init_struct, char *file_name)
{
  //TODO - load from file
  (void)agent_init_struct;
  (void)file_name;
}


CAgentGroup::~CAgentGroup()
{
  unsigned int i;
  for (i = 0; i < agents.size(); i++)
    delete agents[i];

  #ifdef _DEBUG_COMMON_
  printf("%lu : agent group destroyed\n", (unsigned long int)this);
  #endif
}

void CAgentGroup::set_input(std::vector<struct sAgentGroupInput> *input)
{
  this->input = input;
}

void CAgentGroup::rt_timer_callback()
{
  unsigned int i;
  for (i = 0; i < agents.size(); i++)
    agents[i]->agent_set_input(&(*(this->input)[i]));

  for (i = 0; i < agents.size(); i++)
    agents[i]->agent_process();

  printf("%lu processing agents\n", (unsigned int long)this);
}


int CAgentGroup::main()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu agent group main loop started, press ESC to end\n", (unsigned int long)this);
  #endif

  rt_timer_start();

  while (getch() != 27)
  {
    rt_timer_delay_ms(100.0);
  }

  rt_timer_stop();

  return 0;
}
