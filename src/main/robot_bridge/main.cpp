#include "../common/common.h"
#include "bridge_interface.h"
#include "robot_bridge_agent.h"
#include "gui/gui.h"

class CBridgeInterface *bridge_interface;
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
  bridge_interface = new CBridgeInterface();

  gui = new CGUI(bridge_interface);
  gui->run(application_main_func);

  printf("program \'bridge agent\' done\n");

  delete gui;
  delete bridge_interface;
  return 0;
}
