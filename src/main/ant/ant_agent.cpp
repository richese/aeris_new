#include "ant_agent.h"
#include <stdio.h>


extern class CConfigure g_configure;

CAntAgent::CAntAgent()
{

}

CAntAgent::CAntAgent(struct sAgentInterface agent_interface,
                  class CAgentGroup *agent_group,
                  unsigned long int group_id):CAgent(agent_interface, agent_group, group_id)
{
  this->agent_interface.body_type = AGENT_BODY_TYPE_BASIC;

  if (g_configure.get_cm_size() > 20.0)
    this->agent_interface.body_type = AGENT_BODY_TYPE_BASIC_SMALL;

  this->agent_interface.position.x = (0.4 + 0*m_rnd())*g_configure.get_width_cm()/2.0;
  this->agent_interface.position.y = (0.4 + 0*m_rnd())*g_configure.get_height_cm()/2.0;
  this->agent_interface.position.z = 0.0*m_abs(m_rnd())*g_configure.get_depth_cm()/2.0;

  this->agent_interface.color.r = 0.0;
  this->agent_interface.color.g = 0.0;
  this->agent_interface.color.b = 1.0;

  this->agent_interface.agent_type = AGENT_TYPE_ANT;
  this->agent_interface.fitness = 0.0;
  this->agent_interface.state = 0;

  agent_group->set_agent_struct(&this->agent_interface);

  struct sColor tmp;
  tmp.r = 0.0;
  tmp.g = 0.0;
  tmp.b = 0.0;

  unsigned int j;
  for (j = 0; j < 8; j++)
    neighbour.push_back(tmp);

  action = rand()%8;
}

CAntAgent::~CAntAgent()
{

}

unsigned long int CAntAgent::get_agent_type()
{
  return AGENT_TYPE_TESTING;
}

class CAgent* CAntAgent::create(struct sAgentInterface agent_interface, class CAgentGroup *agent_group, unsigned long int group_id)
{
  return new CAntAgent(agent_interface, agent_group, group_id);
}


void CAntAgent::get_neigbour_state()
{
  unsigned int j;
  for (j = 0; j < agent_group->get_agents_count(); j++)
  {
    struct sAgentInterface agent_other = agent_group->get_agent_struct_idx(j);
    if (agent_other.agent_type == AGENT_TYPE_PHEROMONE)
    {
      struct sAgentPosition tmp;
      double dif = 2.1;
      double dist = 0.9;

      tmp.x = agent_interface.position.x + 1.0*dif;
      tmp.y = agent_interface.position.y + 0.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[0].r = agent_other.color.r;
        neighbour[0].g = agent_other.color.g;
        neighbour[0].b = agent_other.color.b;
      }

      tmp.x = agent_interface.position.x + -1.0*dif;
      tmp.y = agent_interface.position.y + 0.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[1].r = agent_other.color.r;
        neighbour[1].g = agent_other.color.g;
        neighbour[1].b = agent_other.color.b;
      }


      tmp.x = agent_interface.position.x + 0.0*dif;
      tmp.y = agent_interface.position.y + 1.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[2].r = agent_other.color.r;
        neighbour[2].g = agent_other.color.g;
        neighbour[2].b = agent_other.color.b;
      }


      tmp.x = agent_interface.position.x + 0.0*dif;
      tmp.y = agent_interface.position.y + -1.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[3].r = agent_other.color.r;
        neighbour[3].g = agent_other.color.g;
        neighbour[3].b = agent_other.color.b;
      }


      tmp.x = agent_interface.position.x + 1.0*dif;
      tmp.y = agent_interface.position.y + 1.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[4].r = agent_other.color.r;
        neighbour[4].g = agent_other.color.g;
        neighbour[4].b = agent_other.color.b;
      }

      tmp.x = agent_interface.position.x + -1.0*dif;
      tmp.y = agent_interface.position.y + 1.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[5].r = agent_other.color.r;
        neighbour[5].g = agent_other.color.g;
        neighbour[5].b = agent_other.color.b;
      }

      tmp.x = agent_interface.position.x + -1.0*dif;
      tmp.y = agent_interface.position.y + -1.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[6].r = agent_other.color.r;
        neighbour[6].g = agent_other.color.g;
        neighbour[6].b = agent_other.color.b;
      }


      tmp.x = agent_interface.position.x + 1.0*dif;
      tmp.y = agent_interface.position.y + -1.0*dif;
      tmp.z = agent_interface.position.z + 0.0*dif;
      if (robot_distance(&agent_other.position, &tmp) < dist)
      {
        neighbour[7].r = agent_other.color.r;
        neighbour[7].g = agent_other.color.g;
        neighbour[7].b = agent_other.color.b;
      }

    }
  }
}

void CAntAgent::agent_process()
{
  int res_rx = agent_group->get_agent_struct(&agent_interface);
  agent_interface.robot_time = get_ms_time();

  agent_interface.body_type = AGENT_BODY_TYPE_NULL;

  if (get_agent_mode(agent_group) == AERIS_MODE_ANTS)
  {
    agent_interface.body_type = AGENT_BODY_TYPE_BASIC;

    if (g_configure.get_cm_size() > 20.0)
      agent_interface.body_type = AGENT_BODY_TYPE_BASIC_SMALL;

    double dt = agent_interface.dt;

    unsigned int j;

    bool on_base = false;
    for (j = 0; j < agent_group->get_agents_count(); j++)
    {
      struct sAgentInterface agent_other = agent_group->get_agent_struct_idx(j);
      double dist = robot_distance(&agent_other.position, &agent_interface.position);

      if ((agent_other.agent_type == AGENT_TYPE_BASE) && (dist < 2.0))
      {
        agent_interface.state = 0;
        agent_interface.fitness = 1.0;
        on_base = true;
        break;
      }

      if ((agent_other.agent_type == AGENT_TYPE_TARGET) && (dist < 2.0))
      {
        agent_interface.state = 1;
        agent_interface.fitness = 1.0;
        break;
      }
    }


    get_neigbour_state();


    if (agent_interface.state == 0)
    {
      float k = 0.7;
      /*
      if (on_base == false)
      {
        float tmp = 0.0;
        for (j = 0; j < neighbour.size(); j++)
          tmp = m_max(tmp, neighbour[j].b);

        agent_interface.fitness = k*tmp;
      }
      */
      agent_interface.fitness = agent_interface.fitness*0.99;
    }
    else
    {
      agent_interface.fitness = agent_interface.fitness*0.99;
    }


    if ((rand()%100) < 30)
    {
      if (agent_interface.state == 0)
      {
        this->agent_interface.color.r = 0.0;
        this->agent_interface.color.g = 0.0;
        this->agent_interface.color.b = 1.0;

        unsigned int i;

        for (i = 0; i < neighbour.size(); i++)
          if (neighbour[i].r > neighbour[action].r)
            action = i;

        if (((rand()%100) < 2) || (neighbour[action].r < 0.2) )
          action = rand()%8;
      }

      if (agent_interface.state == 1)
      {
        this->agent_interface.color.r = 1.0;
        this->agent_interface.color.g = 0.0;
        this->agent_interface.color.b = 0.0;

        unsigned int i;
        action = 0;
        for (i = 0; i < neighbour.size(); i++)
          if (neighbour[i].b > neighbour[action].b)
            action = i;

        if ((rand()%100) < 2)
          action = rand()%8;
      }
    }


    double speed = 0.001;

    switch (action)
    {
      case 0: dx = speed*1.0*dt;
              dy = speed*0.0*dt;
              break;

      case 1: dx = speed*-1.0*dt;
              dy = speed*0.0*dt;
              break;

      case 2: dx = speed*0.0*dt;
              dy = speed*1.0*dt;
              break;

      case 3: dx = speed*0.0*dt;
              dy = speed*-1.0*dt;
              break;

      case 4: dx = speed*1.0*dt;
              dy = speed*1.0*dt;
              break;

      case 5: dx = speed*-1.0*dt;
              dy = speed*1.0*dt;
              break;

      case 6: dx = speed*-1.0*dt;
              dy = speed*-1.0*dt;
              break;

      case 7: dx = speed*1.0*dt;
              dy = speed*-1.0*dt;
              break;
    }


    agent_interface.position.x+= dx;
    agent_interface.position.y+= dy;
    agent_interface.position.z+= dz;

    agent_interface.position.roll+= droll;
    agent_interface.position.pitch+= dpitch;
    agent_interface.position.yaw+= dyaw;


    agent_interface.position.x = m_saturate(-g_configure.get_width_cm()*0.5, g_configure.get_width_cm()*0.5, agent_interface.position.x);
    agent_interface.position.y = m_saturate(-g_configure.get_height_cm()*0.5, g_configure.get_height_cm()*0.5, agent_interface.position.y);
    agent_interface.position.z = m_saturate(-g_configure.get_depth_cm()*0.5, g_configure.get_depth_cm()*0.5, agent_interface.position.z);
  }

  int res_tx = agent_group->set_agent_struct(&agent_interface);

  #ifdef _DEBUG_COMMON_
  printf("%lu : processing agent with %lu id %i %i\n", (unsigned long int)this, agent_interface.id, res_rx, res_tx);
  #endif

  (void)res_rx;
  (void)res_tx;
}
