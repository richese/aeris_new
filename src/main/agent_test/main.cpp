#include "../common/common.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 100;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  class CClient *client_1;



  class CTestingAgent *agent = new CTestingAgent();
  //class CAgent *agent = new CAgent();


  client_1 = new CClient(agent_group_init_struct, agent);
  client_1->main();


  delete client_1;


  printf("program done\n");
  return 0;
}
