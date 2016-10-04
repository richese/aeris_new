#ifndef _AGENT_GROUP_H_
#define _AGENT_GROUP_H_

#include <agent.h>
#include <rt_timer.h>

struct sAgentGroupInitStruct
{
  unsigned int count;
  bool random_positions;

  char server_ip[16];
  unsigned int server_port;

  unsigned int agent_type;
  double dt;
};


class CAgentGroup : public CRT_Timer
{
  protected:
    struct sAgentGroupInitStruct agent_group_init_struct;

    std::vector<struct sAgentInterface> agent_interface;
    std::vector<class CAgent*> agents;

  public:
    CAgentGroup(struct sAgentGroupInitStruct agent_group_init_struct);
    virtual ~CAgentGroup();

    virtual int main();

    unsigned int get_agents_count();
    int set_agent_struct(struct sAgentInterface *value);
    int get_agent_struct(struct sAgentInterface *value);
    struct sAgentInterface get_agent_struct_idx(unsigned int idx);

  protected:
    void rt_timer_callback();
    virtual int connect_to_server();
};


#endif
