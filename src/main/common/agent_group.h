#ifndef _AGENT_GROUP_H_
#define _AGENT_GROUP_H_

#include "agents/agents.h"
#include "rt_timer.h"

#include <thread>
#include <mutex>

struct sAgentGroupInitStruct
{
  unsigned int count;
  bool random_positions;
  double dt;
};


class CAgentGroup : public CRT_Timer
{
  protected:
    unsigned long int group_id;
    struct sAgentGroupInitStruct agent_group_init_struct;

    std::vector<struct sAgentInterface> agent_interface;
    std::mutex mutex_agent_interface;

    std::vector<class CAgent*> agents;

    std::thread *bone_collector_thread;
    bool run;


  public:
    CAgentGroup();
    CAgentGroup(struct sAgentGroupInitStruct agent_group_init_struct, class CAgent *agent);
    virtual ~CAgentGroup();

    virtual int main();

    unsigned int get_agents_count();
    int set_agent_struct(struct sAgentInterface *value);
    int get_agent_struct(struct sAgentInterface *value);
    struct sAgentInterface get_agent_struct_idx(unsigned int idx);


    unsigned long int get_group_id();

  protected:
    void rt_timer_callback();
    virtual int connect_to_server();

  private:
    void bone_collector_thread_func();
};


#endif
