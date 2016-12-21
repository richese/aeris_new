#include "../common/common.h"
#include "robot_bridge_agent.h"
#include "gui/gui.h"

class CGUI *gui;

void application_main_func()
{
  struct sAgentGroupInitStruct agent_group_init_struct;

  agent_group_init_struct.count = 1;
  agent_group_init_struct.random_positions = true;
  agent_group_init_struct.dt = 100.0;

  class CClient *client;
  class CRobotBridgeAgent *agent = new CRobotBridgeAgent();


  client = new CClient(agent_group_init_struct, agent);
  client->main();

  delete client;

  exit(EXIT_SUCCESS);
}

int main()
{
  gui = new CGUI();
  gui->run(application_main_func);

  printf("program \'mode agent\' done\n");

  delete gui;
  return 0;
}
