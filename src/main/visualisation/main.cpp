#include <memory>

#include "../common/agent_group.h"
#include "../common/logging.h"
#include "../common/client.h"

#include "visualisation_agent.h"
#include "visualisation/visualisation.h"


int main(int argc, char *argv[])
{
  logging_init("visualisation", argc, argv);

  struct sAgentGroupInitStruct agent_group_init_struct;
  agent_group_init_struct.count = 1;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  CVisualisation *visualisation = new CVisualisation();
  CVisualisationAgent *agent = new CVisualisationAgent();
  CClient *client = new CClient(agent_group_init_struct, agent, visualisation);

  LOG(INFO) << "Started.";
  client->main();

  LOG(INFO) << "Program done. Cleaning up.";
  delete client;
  delete agent;
  delete visualisation;

  return 0;
}
