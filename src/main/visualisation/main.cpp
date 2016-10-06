#include "../common/common.h"
#include "visualisation_agent.h"
#include "visualisation/visualisation.h"

int main()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 1;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  class CClient *client;

  class CVisualisation *visualisation = new CVisualisation();
  class CVisualisationAgent *agent = new CVisualisationAgent();

  client = new CClient(agent_group_init_struct, agent, visualisation);
  client->main();


  delete client;
  delete visualisation;

  printf("program done\n");
  return 0;
}
