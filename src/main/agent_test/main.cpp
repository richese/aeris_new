#include "../common/common.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;
  agent_group_init_struct.count = 10;
  agent_group_init_struct.random_positions = true;


  struct sAgentInitStruct agent_init_struct;

  agent_init_struct.dt = 1.0/20.0;
  agent_init_struct.agent_type = 0;



  class CAgentGroup *agent_group;

  agent_group = new CAgentGroup(agent_init_struct, agent_group_init_struct);

  agent_group->main();

  delete agent_group;

  printf("program done\n");
  return 0;
}
