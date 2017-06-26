#ifndef _PLUGIN_H_
#define _PLUGIN_H_

#include <map>
#include <memory>
#include <mutex>
#include <string>

#include "agent.h"
#include "agent_body.h"
#include "config.h"
#include "logging.h"
#include "types.h"


namespace ae {


namespace plugin {

class Plugin;

/** \brief Wrapper around Plugin class to handle automatic destruction at
 * program end.
 *
 * \see ae::helpers::PluginStorage
 */
using PluginPtr = std::shared_ptr<Plugin>;

} /* namespace plugin */

namespace helpers {


/** \brief Shared storage for loaded plugins. */
using PluginStorage = SharedStorage<std::map<std::string, ae::plugin::PluginPtr>>;


} /* namespace helpers */


/** \brief Namespace contains functionality of plugins and dynamic library
 * handling.
 */
namespace plugin {


/** \brief Structure used to pass pointers to application wide shared data.
 *
 * This is needed because plugins are in the form of dynamically loaded shared
 * libraries.
 * At the same time plugins are statically linked with Aeris library.
 * The result of this is that each plugin and main application have their own
 * copy of all global variables.
 * Therefore it is needed to synchronize state of all global variables so that
 * everyone uses the same resources and not just their private copy of it.
 */
class SharedData
{
public:
  /** \brief Initialize structure with valid pointers to all storages. */
  SharedData();


  const nlohmann::json &conf_storage;
  el::base::type::StoragePointer log_storage;
  ae::helpers::PluginStorage *plugin_storage;
  ae::helpers::BodyStorage *body_storage;
};


void setPluginStorage(SharedData &data);


/** \brief Interface that all plugins must provide and implement. */
struct PluginAPI
{
  /** \brief Pointer to function used to pass shared data storage pointer to
   * plugin.
   *
   * The plugin must update its library side gloval variables with these
   * pointers.
   * The best way to do this is to call init_data.initStorage() as the
   * first thing in this function..
   *
   * \see SharedData
   */
  int (*init) (ae::plugin::SharedData &init_data);

  /** \brief */
  std::vector<ae::Agent*> (*create) (const nlohmann::json &parameters);
};


class Plugin
{
public:
  static PluginPtr get(const std::string &name);

public:
  ~Plugin();

  std::vector<ae::Agent*> createAgents(const nlohmann::json &parameters);

private:
  Plugin(void *handle, PluginAPI *api);

  /** \brief Shared library handler. */
  void *m_so_handle;

  PluginAPI *m_api;
};


void agentSpawner(const nlohmann::json &list, std::vector<ae::Agent*> &agents);


} /* namespace plugin */


} /* namespace ae */


#endif /* _PLUGIN_H_ */
