#include "food_agent.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 1;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  class CClient *client;



  class CFoodAgent *agent = new CFoodAgent();
  //class CAgent *agent = new CAgent();


  client = new CClient(agent_group_init_struct, agent);
  // client->set_connection_method(CClient::USE_AF_INET);
  client->main();


  delete client;


  printf("program \'food\' done\n");
  return 0;
}
