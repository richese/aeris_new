#include "plugin.h"

// toto je v oddelenej kompilačnej jednotke aby sa agenti nemuseli linkovať s -ldl

int ae::plugin::plugin_init(ae::plugin::plugin_init_t &init_data)
{
  el::Helpers::setStorage(init_data.log_storage);
  ae::config::set_configuration(init_data.conf_storage);
  AgentBodyStorage::set_storage(init_data.body_storage);

  return 0;
}
