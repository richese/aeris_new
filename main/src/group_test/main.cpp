#include "common/config.h"
#include "common/logging.h"
#include "common/agent_group.h"
#include "common/plugin.h"

using namespace ae;

int main(int argc, char *argv[])
{
  if (ae::config::setup("test", argc, argv) < 0)
  {
    return 1;
  }

  AgentGroup group = AgentGroup(time::milliseconds(1000), 1);

  plugin::Agent example_agent_plugin = plugin::Agent("example_agent");
  if (example_agent_plugin.load() < 0)
  {
    return 1;
  }

  Agent * a = example_agent_plugin.create(nlohmann::json());
  if (a == nullptr)
  {
    LOG(ERROR) << "Failed to create agent from plugin";
    return 1;
  }

  group.push_back(a);

  group.main();

  LOG(INFO) << "Exiting.";
  return 0;
}
