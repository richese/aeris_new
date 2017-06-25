#include <map>
#include <memory>
#include <mutex>
#include <string>

#include <dlfcn.h>  // funkcie na prácu s dynamicky otváranými zdieľanými knižnicami (dlopen, dlsym, dlclose)

#include "agent.h"
#include "config.h"
#include "logging.h"
#include "plugin.h"


namespace ae
{
namespace plugin
{

PluginStorage::handle_map_t PluginStorage::loaded_plugins = PluginStorage::handle_map_t();

std::mutex PluginStorage::lock_loaded_plugins;

} /* namespace plugin */
} /* namespace ae */


ae::plugin::plugin_t* ae::plugin::PluginStorage::open_plugin(const std::string &name)
{
  std::lock_guard<std::mutex> plugin_guard(lock_loaded_plugins);
  plugin_t *plugin = nullptr;

  if ((plugin = find_plugin(name)) != nullptr)
  {
    return plugin;
  }
  else
  {
    std::string libname = "lib";
    libname += name;
    libname += ".so";
    libname = config::path(config::DIR_LIB, libname);

    // otvor zdieľanú knižnicu
    void *handle = nullptr;
    if ((handle = dlopen(libname.c_str(), PLUGIN_RTLD_POLICY)) == nullptr)
    {
      LOG(ERROR) << "Failed to open plugin " << name << " (" << libname << "): " << dlerror();
      return nullptr;
    }

    // zisti adresu load funkcie ${NAME}_load
    std::string load_func_name = name + "_load";
    char *err = dlerror();
    plugin_t* (*load_func)() = (plugin_t*(*)()) dlsym(handle, load_func_name.c_str());
    if ((err = dlerror()) != nullptr)
    {
      LOG(ERROR) << "Plugin load function symbol failed in " << name << " (" << libname << "): " << err;
      dlclose(handle);
      return nullptr;
    }
    if (load_func == nullptr)
    {
      LOG(ERROR) << "Plugin load function symbol not found in " << name << " (" << libname << ")";
      dlclose(handle);
      return nullptr;
    }

    // získaj štruktúru s informáciami o plugine od load funkcie
    plugin = load_func();
    if (plugin == nullptr)
    {
      LOG(ERROR) << "Plugin " << name << " (" << libname << ") load error.";
      dlclose(handle);
      return nullptr;
    }

    // inicializuj globálne premenné v kóde zdieľanej knižnice
    if (plugin->init != nullptr)
    {
      plugin_init_t init_data;
      init_data.log_storage = el::Helpers::storage();
      init_data.body_storage = ae::helpers::get_body_storage();

      if (plugin->init(init_data) != 0)
      {
        LOG(ERROR) << "Plugin initialization failed: " << name << " (" << libname << ")";
        return nullptr;
      }
    }
    else
    {
      LOG(ERROR) << "Invalid init function in plugin " << name << " (" << libname << ")";
      dlclose(handle);
      return nullptr;
    }

    // pridaj plugin do mapy pluginov aby sa automaticky zatvorila zdieľaná
    // knižnica pri ukončení programu
    register_plugin(name, handle, plugin);

    return plugin;
  }
}


void ae::plugin::PluginStorage::register_plugin(const std::string &name, void *handle, plugin_t *plugin)
{
  loaded_plugins[name] = std::unique_ptr<PluginStorage>(new PluginStorage(handle, plugin));
}


ae::plugin::plugin_t* ae::plugin::PluginStorage::find_plugin(const std::string &name)
{
  auto has_plugin = loaded_plugins.find(name);
  if (has_plugin != loaded_plugins.end())
  {
    return has_plugin->second->plugin;
  }
  else
  {
    return nullptr;
  }
}


ae::plugin::PluginStorage::PluginStorage(void *handle, plugin_t *plugin):
  handle(handle),
  plugin(plugin)
{

}


ae::plugin::PluginStorage::~PluginStorage()
{
  if (handle != nullptr)
  {
    dlclose(handle);
    handle = nullptr;
    plugin = nullptr;
  }
}


ae::plugin::Agent::Agent(const char *agent_name) :
  m_plugin_name(agent_name),
  m_plugin(nullptr)
{

}


ae::plugin::Agent::~Agent()
{

}


int ae::plugin::Agent::load()
{
  m_plugin = PluginStorage::open_plugin(m_plugin_name);
  if (m_plugin == nullptr)
  {
    return -1;
  }

  // over, že plugin obsahuje funkciu na vytváranie agentov
  if (m_plugin->create == nullptr)
  {
    LOG(ERROR) << "Plugin " << m_plugin_name << " is not an Agent plugin.";
    m_plugin = nullptr;
    return -1;
  }

  return 0;
}


std::vector<ae::Agent*> ae::plugin::Agent::create(const json &parameters)
{
  std::vector<ae::Agent*> agents;

  if (m_plugin != nullptr && m_plugin->create != nullptr)
  {
    agents = m_plugin->create(parameters);
  }

  return agents;
}


void ae::plugin::agent_spawner(const nlohmann::json &list, std::vector<ae::Agent*> &agents)
{
  for (const auto &item : list)
  {
    if (!item.is_object())
    {
      LOG(WARNING) << "Invalid entry in group spawn array: " << item;
      continue;
    }

    // get plugin name
    if (item.find("plugin") == item.end() ||
        !item["plugin"].is_string())
    {
      LOG(WARNING) << "Invalid entry in group spawn array: " << item;
      continue;
    }
    const std::string &plugin_name = item["plugin"];

    // get agent spawn count
    int count = 1;
    if (item.find("count") != item.end())
    {
      if (item["count"].is_number_unsigned())
      {
        count = item["count"];
      }
      else
      {
        LOG(WARNING) << "Invalid type for spawn count given: " << item["count"];
      }
    }

    // get agent parameters
    auto params = nlohmann::json::object();
    if (item.find("params") != item.end() &&
        item["params"].is_object())
    {
      params = item["params"];
    }

    // open plugin
    ae::plugin::Agent plugin(plugin_name.data());
    if (plugin.load() < 0)
    {
      LOG(ERROR) << "Failed to open plugin " << plugin_name << ". Skipping...";
      continue;
    }

    // spawn agents
    for (int i = 0; i < count; ++i)
    {
      std::vector<ae::Agent*> new_agents = plugin.create(params);
      agents.insert(agents.end(), new_agents.begin(), new_agents.end());
    }
  }
}
