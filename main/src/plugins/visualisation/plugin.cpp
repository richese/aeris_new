#include <vector>

#include "common/agent.h"  // pre ae::Agent
#include "common/logging.h"
#include "common/plugin.h" // pre ae::plugin::PluginAPI, nlohmann::json, el::base::type::StoragePointer

#include "visualisation_agent.h"


// mená, ktoré používame
using json = nlohmann::json;
using el::base::type::StoragePointer;
using namespace ae;
using ae::plugin::PluginAPI;
using ae::plugin::SharedData;


// forward declarations for plugin functions
extern "C" PluginAPI* visualisation_load();
int visualisation_init(SharedData &init_data);
std::vector<Agent*> visualisation_create(const json &parameters);


// štruktúra pluginu
static PluginAPI visualisation_plugin = {
  visualisation_init, // or just ae::plugin::plugin_init
  visualisation_create
};


// plugin load function
extern "C" PluginAPI* visualisation_load()
{
  return &visualisation_plugin;
}


// Inicializuje plugin a vypíše správu do logu.
int visualisation_init(SharedData &init_data)
{
  // nastav globálne premenné
  ae::plugin::setPluginStorage(init_data);

  // tu si plugin môže robiť svoje veci

  // napr môže skontrolovať, že konfiguračný súbor naozaj obsahuje položky pre
  // agentov ktorých tento plugin vytvára
  const auto &agent_list = config::get["agent_list"];
  if (agent_list.find("example_agent") == agent_list.end())
  {
    LOG(ERROR) << "Configuration is missing 'agent_list' entry for 'visualisation'";
    return -1;
  }

  LOG(INFO) << "Visualisation plugin initialized.";

  // vráť nulu pri úspešnej inicializácii
  return 0;
}


// Funkcia, ktorá vytvára agentov na základe predaných parametrov.
std::vector<Agent*> visualisation_create(const json &parameters)
{
  std::vector<Agent*> agents;

  VisualisationAgent *vis = new VisualisationAgent(parameters);
  if (vis == nullptr)
  {
    LOG(ERROR) << "Visualisation agent allocation error.";
  }
  else
  {
    agents.push_back(vis);
  }

  return agents;
}
