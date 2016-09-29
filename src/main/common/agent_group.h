#ifndef _AGENT_GROUP_H_
#define _AGENT_GROUP_H_

#include <agent.h>

struct sAgentGroupInitStruct
{
  unsigned int count;
  bool random_positions;

  char server_ip[16];
  unsigned int server_port;
};



struct sAgentGroupInput
{
  std::vector<struct sAgentInput> input;
  unsigned int robot_id;                    //target robot id
};

class CAgentGroup
{
  private:
    struct sAgentGroupInitStruct agent_group_init_struct;
    struct sAgentInitStruct agent_init_struct;

    std::vector<class CAgent*> agents;

  public:
    CAgentGroup(struct sAgentInitStruct agent_init_struct, struct sAgentGroupInitStruct agent_group_init_struct);
    CAgentGroup(struct sAgentInitStruct agent_init_struct, char *file_name);
    ~CAgentGroup();

    void set_input(std::vector<struct sAgentGroupInput> *input);

    int main();
};


#endif
