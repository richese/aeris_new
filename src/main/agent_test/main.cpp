#include "../common/common.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 300;
  agent_group_init_struct.random_positions = true;

  /*
    char server_ip[16];
    unsigned int server_port;
*/
  sprintf(agent_group_init_struct.server_ip,"127.0.0.1");
  agent_group_init_struct.server_port = 2000;
  agent_group_init_struct.agent_type = AGENT_TYPE_NULL;
  agent_group_init_struct.dt = 5.0;

  class CClientLocal *client_local;

  client_local = new CClientLocal(agent_group_init_struct);

  client_local->main();

  delete client_local;

  printf("program done\n");
  return 0;
}