#include "../common/agent_group.h"
#include "../common/logging.h"
#include "../common/client.h"

#include "base_agent.h"


int main(int argc, char *argv[])
{
  logging_init("base", argc, argv);
  
  struct sAgentGroupInitStruct agent_group_init_struct;
  agent_group_init_struct.count = 250;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  CBaseAgent *agent = new CBaseAgent();
  CClient *client = new CClient(agent_group_init_struct, agent);

  LOG(INFO) << "Started.";
  client->main();

  LOG(INFO) << "Program done. Cleaning up.";
  delete client;
  delete agent;
  
  return 0;
}
