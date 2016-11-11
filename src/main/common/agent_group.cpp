#include "agent_group.h"

#include "math_robot.h"
#include "unique_id.h"
#include "signals.h"

#include "configure.h"
#include "ms_time.h"

#include "debug.h"
#include "agents/agents.h"


#define _POSIX_C_SOURCE 200809L

#include <sys/time.h>
// #include <time.h>
#include <unistd.h>

extern class CConfigure g_configure;


CAgentGroup::CAgentGroup()
{
  run = true;

  group_id = get_unique_id();

  //TODO - not working yet
  //bone_collector_thread = new std::thread(&CAgentGroup::bone_collector_thread_func, this);
}

CAgentGroup::CAgentGroup(struct sAgentGroupInitStruct agent_group_init_struct, class CAgent *agent)
{
  unsigned int i;

  this->agent_group_init_struct = agent_group_init_struct;
  group_id = get_unique_id();

  struct sAgentInterface agent_interface_;

  agent_interface_.position.x = 0.0;
  agent_interface_.position.y = 0.0;
  agent_interface_.position.z = 0.0;

  agent_interface_.position.roll = 0.0;
  agent_interface_.position.pitch = 0.0;
  agent_interface_.position.yaw = 0.0;

  agent_interface_.state = 0;
  agent_interface_.id = 0;
  agent_interface_.robot_time = 0.0;
  agent_interface_.dt = agent_group_init_struct.dt;



  for (i = 0; i < agent_group_init_struct.count; i++)
  {
    agent_interface_.position.x = m_rnd()*g_configure.get_width_cm()/2.0;
    agent_interface_.position.y = m_rnd()*g_configure.get_height_cm()/2.0;
    agent_interface_.position.z = 0.0*m_rnd()*g_configure.get_depth_cm()/2.0;

    agents.push_back(agent->create(agent_interface_, this, get_group_id()));
  }


  #ifdef _DEBUG_COMMON_
  printf("%lu : agent group created\n", (unsigned long int)this);
  #endif

  run = true;
  rt_timer_set_period(agent_group_init_struct.dt);

  bone_collector_thread = NULL;
//  bone_collector_thread = new std::thread(&CAgentGroup::bone_collector_thread_func, this);
}



CAgentGroup::~CAgentGroup()
{
  unsigned int i;

  run = false;

  if (bone_collector_thread != NULL)
  {
    bone_collector_thread->join();
    delete bone_collector_thread;
  }

  for (i = 0; i < agents.size(); i++)
    delete agents[i];

  #ifdef _DEBUG_COMMON_
  printf("%lu : agent group destroyed\n", (unsigned long int)this);
  #endif
}

void CAgentGroup::rt_timer_callback()
{
  unsigned int i;

  #ifdef _DEBUG_COMMON_
  printf("%lu : processing agents\n", (unsigned int long)this);
  #endif

  for (i = 0; i < agents.size(); i++)
    if (agent_interface[i].id != 0)
      if (agent_interface[i].group_id == group_id)
        agents[i]->agent_process();

  int res = connect_to_server();

  #ifdef _ERROR_COMMON_
  if (res < 0)
    printf("%lu : connecting to %s:%i error with %i\n", (unsigned int long)this, g_configure.get_server_ip(), g_configure.get_server_port(), res);
  #endif
}


int CAgentGroup::main()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : agent group main loop started, press ESC to end\n", (unsigned int long)this);
  #endif


  rt_timer_start();

  while (!received_exit_signal())
  {
    rt_timer_delay_ms(100.0);
    #ifdef _DEBUG_COMMON_
    printf("%lu : agent group main loop running, press ESC to end\n", (unsigned int long)this);
    #endif
  }

  rt_timer_stop();

  return 0;
}


unsigned int CAgentGroup::get_agents_count()
{
  return agent_interface.size();
}

int CAgentGroup::set_agent_struct(struct sAgentInterface *value)
{
  unsigned int i;
  int res = -1;

  mutex_agent_interface.lock();

  for (i = 0; i < agent_interface.size(); i++)
    if (value->group_id == agent_interface[i].group_id)
    if (value->id == agent_interface[i].id)
    {
      agent_interface[i] = *value;
      res = 1;
      break;
    }

  if (res == -1)
  {
    agent_interface.push_back(*value);
  }

  mutex_agent_interface.unlock();

  return res;
}


int CAgentGroup::get_agent_struct(struct sAgentInterface *value)
{
  unsigned int i;
  int res = -1;

  mutex_agent_interface.lock();


  for (i = 0; i < agent_interface.size(); i++)
    if (value->id == agent_interface[i].id)
    {
      *value = agent_interface[i];
      res = 1;
      break;
    }

  mutex_agent_interface.unlock();

  return res;
}

struct sAgentInterface CAgentGroup::get_agent_struct_idx(unsigned int idx)
{
  struct sAgentInterface res;
  mutex_agent_interface.lock();
  res = agent_interface[idx];
  mutex_agent_interface.unlock();

  return res;
}

int CAgentGroup::connect_to_server()
{
  return 0;
}

unsigned long int CAgentGroup::get_group_id()
{
  return group_id;
}

void CAgentGroup::bone_collector_thread_func()
{
  double robot_death_time = 2.0*1000.0;

  while (run)
  {
    usleep(robot_death_time*1000.0);

    printf("bone collector thread\n");

    mutex_agent_interface.lock();
    unsigned int i;

    for (i = 0; i < agent_interface.size(); i++)
      if (agent_interface[i].id != 0)
      if ((agent_interface[i].robot_time + robot_death_time) < get_ms_time())
      {
        printf("robot %lu from %lu has been TERMINATED\n", agent_interface[i].id, agent_interface[i].group_id);
        // agent_interface[i].id = 0;
      }

    mutex_agent_interface.unlock();
  }
}
