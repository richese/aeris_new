#include "../common/common.h"
#include "border_agent.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 1;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 1000.0;

  class CClient *client;

  class CBorderAgent *agent = new CBorderAgent();

  client = new CClient(agent_group_init_struct, agent);
  client->main();


  delete client;

  printf("program done\n");
  return 0;
}
