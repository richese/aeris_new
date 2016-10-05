#include <agent_group.h>
#include <debug.h>

#include <math_robot.h>
#include <getch.h>
#include <unique_id.h>

#include <configure.h>


extern class CConfigure g_configure;

CAgentGroup::CAgentGroup(struct sAgentGroupInitStruct agent_group_init_struct)
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

  agent_interface_.agent_type = agent_group_init_struct.agent_type;
  agent_interface_.body_type = AGENT_BODY_TYPE_RANDOM;
  agent_interface_.state = 0;
  agent_interface_.id = 0;
  agent_interface_.robot_time = 0.0;
  agent_interface_.dt = agent_group_init_struct.dt;



  for (i = 0; i < agent_group_init_struct.count; i++)
  {
    agent_interface_.position.x = m_rnd()*g_configure.get_width_cm();
    agent_interface_.position.y = m_rnd()*g_configure.get_height_cm();
    agent_interface_.position.z = 0.0*m_rnd()*g_configure.get_depth_cm();

    agents.push_back(new CAgent(agent_interface_, this, get_group_id()));
  }


  #ifdef _DEBUG_COMMON_
  printf("%lu : agent group created\n", (unsigned long int)this);
  #endif

  rt_timer_set_period(agent_group_init_struct.dt);
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

void CAgentGroup::rt_timer_callback()
{
  unsigned int i;

  #ifdef _DEBUG_COMMON_
  printf("%lu : processing agents\n", (unsigned int long)this);
  #endif

  for (i = 0; i < agents.size(); i++)
    if (agent_interface[i].group_id == group_id)
      agents[i]->agent_process();

  int res = connect_to_server();

  /*
  if (res < 0)
    res = connect_to_server();
    */

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

  while (getch() != 27)
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

  return res;
}


int CAgentGroup::get_agent_struct(struct sAgentInterface *value)
{
  unsigned int i;
  int res = -1;
  for (i = 0; i < agent_interface.size(); i++)
    if (value->id == agent_interface[i].id)
    {
      *value = agent_interface[i];
      res = 1;
      break;
    }

  return res;
}

struct sAgentInterface CAgentGroup::get_agent_struct_idx(unsigned int idx)
{
  return agent_interface[idx];
}

int CAgentGroup::connect_to_server()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : agent group connect to %s %i - not implemented\n", (unsigned int long)this, agent_group_init_struct.server_ip, agent_group_init_struct.server_port);
  #endif

  return 0;
}

unsigned long int CAgentGroup::get_group_id()
{
  return group_id;
}
