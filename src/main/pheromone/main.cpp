#include "pheromone_agent.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 600;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  class CClient *client;

  class CPheromoneAgent *agent = new CPheromoneAgent();

  client = new CClient(agent_group_init_struct, agent);
  client->main();


  delete client;

  printf("program \'pheromone\' done\n");
  return 0;
}
