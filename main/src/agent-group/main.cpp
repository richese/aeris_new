#include <vector>

#include "common/config.h"
#include "common/logging.h"
#include "common/agent_group.h"
#include "common/agent_body.h"
#include "common/plugin.h"

using namespace ae;

int main(int argc, char *argv[])
{
  if (ae::config::setup("agent-group", argc, argv) < 0)
  {
    return 1;
  }

  srand(::time(nullptr));

  // check if this agent group is defined in configuration file
  {
    const std::string &group_name = config::get["name"];
    const auto group_list = config::get["agent_group_list"];
    if (group_list.find(group_name) == group_list.end() ||
        !group_list[group_name].is_object())
    {
      LOG(ERROR) << "Missing configuration entry for group \"" << group_name << "\".";
      return 1;
    }
  }
  auto group_config = config::get["agent_group_list"][config::get["name"].get<std::string>()];

  // set dt
  int dt = 1000;
  if (group_config.find("dt") != group_config.end() &&
      group_config["dt"].is_number_unsigned())
  {
    dt = group_config["dt"];
  }
  VLOG(4) << "Group dt: " << dt << "ms";

  // set number of jobs
  int njobs = 1;
  if (group_config.find("njobs") != group_config.end() &&
      group_config["njobs"].is_number_unsigned())
  {
    njobs = group_config["njobs"];
  }
  VLOG(4) << "Group process threads: " << njobs;

  // create agent group
  NetAgentGroup agent_group(time::milliseconds(dt), njobs);

  // spawn agents
  {
    std::vector<Agent*> spawned_agents;

    if (group_config.find("spawn") != group_config.end() &&
        group_config["spawn"].is_array())
    {
      plugin::agent_spawner(group_config["spawn"], spawned_agents);
    }
    for (auto a : spawned_agents)
    {
      agent_group.push_back(a);
    }
  }

  // start agent group main loop
  agent_group.main();


  LOG(INFO) << "Exiting.";
  return 0;
}
