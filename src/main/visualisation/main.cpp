#include "../common/common.h"
#include "visualisation_agent.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 1;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  class CClient *client_1;


  class CVisualisationAgent *agent = new CVisualisationAgent();

  client_1 = new CClient(agent_group_init_struct, agent, true);
  client_1->main();


  delete client_1;

  printf("program done\n");
  return 0;
}
