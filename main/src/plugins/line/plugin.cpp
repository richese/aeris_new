#include <vector>

#include "common/agent.h"
#include "common/logging.h"
#include "common/plugin.h"

#include "elipse_line.h"

INITIALIZE_EASYLOGGINGPP

using json = nlohmann::json;
using el::base::type::StoragePointer;
using namespace ae;
using ae::plugin::plugin_t;
using ae::plugin::plugin_init_t;
using ae::plugin::plugin_init;


extern "C" plugin_t* line_load();
int line_plugin_init(plugin_init_t &init_data);
std::vector<Agent*> line_plugin_create(const json &parameters);


static plugin_t line_plugin = {
  line_plugin_init, // or just ae::plugin::plugin_init
  line_plugin_create
};


extern "C" plugin_t* line_load()
{
  return &line_plugin;
}


int line_plugin_init(plugin_init_t &init_data)
{
  plugin_init(init_data);

  // check configuration
  const auto &agent_list = config::get["agent_list"];
  if (agent_list.find("line") == agent_list.end())
  {
    LOG(ERROR) << "Configuration is missing 'line' entry for 'line' plugin.";
    return -1;
  }

  LOG(INFO) << "Line plugin initialized.";
  return 0;
}


std::vector<Agent*> line_plugin_create(const json &parameters)
{
  std::vector<Agent*> agents;

  if (!parameters.is_object())
  {
    LOG(ERROR) << "Invalid parameters for line agent creation.";
    return agents;
  }

  std::string line_type = "elipse";
  if (parameters.find("type") != parameters.end() &&
      parameters["type"].is_string())
  {
    line_type = parameters["type"];
  }

  if (line_type.compare("elipse") == 0)
  {
    agents = ElipseLine::spawn_line(parameters);
  }
  // other line types go here
  else
  {
    LOG(ERROR) << "Invalid type of line: " << line_type;
  }

  return agents;
}
