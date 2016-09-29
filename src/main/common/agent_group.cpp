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
  (void)input;
}

float timer_get_time()
{
  std::chrono::milliseconds ms = std::chrono::duration_cast< std::chrono::milliseconds >(std::chrono::system_clock::now().time_since_epoch());
  float res = ms.count();
  return res;
}

void sleep_ms(float x)
{
  usleep(x*1000);
}

int CAgentGroup::main()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu agent group main loop started, press ESC to end\n", (unsigned int long)this);
  #endif

  while (getch() != 27)
  {
    float time_start = timer_get_time();

    //TODO - process agents here

    float time_stop = timer_get_time();
    float delay_time = agent_init_struct.dt - (time_stop - time_start);

    #ifdef _DEBUG_COMMON_
    if (delay_time < 0.0)
      printf("%lu agent group RT warning %6.3f\n", (unsigned long int)this, delay_time);
    #endif

    sleep_ms(delay_time);
  }


  #ifdef _DEBUG_COMMON_
  printf("%lu agent group main loop ENDED\n", (unsigned int long)this);
  #endif

  return 0;
}
