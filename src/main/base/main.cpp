#include "base_agent.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 250;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  class CClient *client;



  class CBaseAgent *agent = new CBaseAgent();
  //class CAgent *agent = new CAgent();


  client = new CClient(agent_group_init_struct, agent);
  client->main();


  delete client;


  printf("program done\n");
  return 0;
}
