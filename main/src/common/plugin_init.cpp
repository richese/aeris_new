#include "plugin.h"


ae::plugin::SharedData::SharedData() :
  conf_storage(ae::config::get),
  log_storage(el::Helpers::storage()),
  plugin_storage(ae::helpers::PluginStorage::get()),
  body_storage(ae::helpers::BodyStorage::get())
{

}


void ae::plugin::setPluginStorage(SharedData &data)
{
  el::Helpers::setStorage(data.log_storage);
  ae::config::set_configuration(data.conf_storage);
  ae::helpers::PluginStorage::set(data.plugin_storage);
  ae::helpers::BodyStorage::set(data.body_storage);
}
