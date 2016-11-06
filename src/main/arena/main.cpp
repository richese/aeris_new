#include "../common/common.h"
#include "arena_agent.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 1;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 2000.0;

  class CClient *client;

  class CArenaAgent *agent = new CArenaAgent();

  client = new CClient(agent_group_init_struct, agent);
  client->main();


  delete client;

  printf("program \'arena\' done\n");
  return 0;
}
