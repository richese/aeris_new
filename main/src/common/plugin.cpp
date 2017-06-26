#include <map>
#include <memory>
#include <mutex>
#include <string>

#include <dlfcn.h>  // funkcie na prácu s dynamicky otváranými zdieľanými knižnicami (dlopen, dlsym, dlclose)

#include "agent.h"
#include "config.h"
#include "logging.h"
#include "plugin.h"


ae::plugin::PluginPtr ae::plugin::Plugin::get(const std::string &name)
{
  PluginPtr plugin = nullptr;

  auto *plugin_storage = ae::helpers::PluginStorage::get();
  std::lock_guard<std::mutex> lock_plugin_storage(plugin_storage->lock);

  // check if this plugin is already loaded
  if (plugin_storage->data.find(name) != plugin_storage->data.end())
  {
    plugin = plugin_storage->data[name];
  }

  // try to load the plugin
  if (plugin == nullptr)
  {
    LOG(INFO) << "Loading plugin: " << name;

    std::string libname = "lib";
    libname += name;
    libname += ".so";
    libname = config::path(config::DIR_LIB, libname);

    // try to open the shared library
    void *handle = nullptr;
    if ((handle = dlopen(libname.c_str(), RTLD_NOW)) == nullptr)
    {
      LOG(ERROR) << "Failed to open plugin " << name << " (" << libname << "): " << dlerror();
      return nullptr;
    }

    // get pointer to load function: ${NAME}_load
    std::string load_func_name = name + "_load";
    char *err = dlerror();
    PluginAPI* (*load_func)() = (PluginAPI*(*)()) dlsym(handle, load_func_name.c_str());
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

    // get pointer to plugin api by calling load function
    PluginAPI *api = load_func();
    if (api == nullptr)
    {
      LOG(ERROR) << "Plugin " << name << " (" << libname << ") load error.";
      dlclose(handle);
      return nullptr;
    }

    // initialize plugin global storage
    if (api->init != nullptr)
    {
      SharedData storages;
      if (api->init(storages) != 0)
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

    // create plugin instance
    plugin = PluginPtr(new Plugin(handle, api));
    if (!plugin)
    {
      LOG(ERROR) << "Failed to allocate plugin: " << name << " (" << libname << ")";
    }

    // save opened plugin to storage
    plugin_storage->data[name] = plugin;
  }

  return plugin;
}


ae::plugin::Plugin::Plugin(void *handle, PluginAPI *api) :
  m_so_handle(handle),
  m_api(api)
{

}


ae::plugin::Plugin::~Plugin()
{
  if (m_so_handle != nullptr)
  {
    dlclose(m_so_handle);
    m_so_handle = nullptr;
    m_api = nullptr;
  }
}


std::vector<ae::Agent*> ae::plugin::Plugin::createAgents(const nlohmann::json &parameters)
{
  std::vector<ae::Agent*> agents;

  if (m_api != nullptr && m_api->create != nullptr)
  {
    agents = m_api->create(parameters);
  }

  return agents;
}


void ae::plugin::agentSpawner(const nlohmann::json &list, std::vector<ae::Agent*> &agents)
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
    PluginPtr plugin = Plugin::get(plugin_name);
    if (!plugin)
    {
      LOG(ERROR) << "Failed to open plugin " << plugin_name << ". Skipping...";
      continue;
    }

    // spawn agents
    for (int i = 0; i < count; ++i)
    {
      std::vector<ae::Agent*> new_agents = plugin->createAgents(params);
      agents.insert(agents.end(), new_agents.begin(), new_agents.end());
    }
  }
}
