#include "../common/agent_group.h"
#include "../common/logging.h"
#include "../common/client.h"

#include "line_agent.h"


int main(int argc, char *argv[])
{
  logging_init("line", argc, argv);

  struct sAgentGroupInitStruct agent_group_init_struct;
  agent_group_init_struct.count = 900;
  agent_group_init_struct.random_positions = false;
  agent_group_init_struct.dt = 100.0;

  CLineAgent *agent = new CLineAgent();
  CClient *client = new CClient(agent_group_init_struct, agent);

  LOG(INFO) << "Started.";
  client->main();

  LOG(INFO) << "Program done. Cleaning up.";
  delete client;
  delete agent;

  return 0;
}
