#include <vector>

#include "common/agent.h"  // pre ae::Agent
#include "common/logging.h"
#include "common/plugin.h" // pre ae::plugin::plugin_t, ae::plugin::plugin_init, nlohmann::json, el::base::type::StoragePointer

#include "example_agent.h"


// mená, ktoré používame
using json = nlohmann::json;
using el::base::type::StoragePointer;
using namespace ae;
using ae::plugin::plugin_t;
using ae::plugin::plugin_init_t;
using ae::plugin::plugin_init;


// forward declarations for plugin functions
extern "C" plugin_t* example_agent_load();
int example_agent_init(plugin_init_t &init_data);
std::vector<Agent*> example_agent_create(const json &parameters);


// štruktúra pluginu
static plugin_t example_agent_plugin = {
  example_agent_init, // or just ae::plugin::plugin_init
  example_agent_create
};


// plugin load function
extern "C" plugin_t* example_agent_load()
{
  return &example_agent_plugin;
}


// Inicializuje plugin a vypíše správu do logu.
int example_agent_init(plugin_init_t &init_data)
{
  // nastav globálne premenné
  plugin_init(init_data);

  // tu si plugin môže robiť svoje veci

  // napr môže skontrolovať, že konfiguračný súbor naozaj obsahuje položky pre
  // agentov ktorých tento plugin vytvára
  const auto &agent_list = config::get["agent_list"];
  if (agent_list.find("example_agent") == agent_list.end())
  {
    LOG(ERROR) << "Configuration is missing 'agent_list' entry for 'example_agent'";
    return -1;
  }

  LOG(INFO) << "ExampleAgent plugin initialized.";

  // vráť nulu pri úspešnej inicializácii
  return 0;
}


// Funkcia, ktorá vytvára agentov na základe predaných parametrov.
std::vector<Agent*> example_agent_create(const json &parameters)
{
  std::vector<Agent*> arr;

  ExampleAgent *agent = new ExampleAgent(parameters);
  if (agent != nullptr)
  {
    arr.push_back(agent);
  }

  return arr;
}
