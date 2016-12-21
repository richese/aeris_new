#ifndef _CONFIG_H_
#define _CONFIG_H_

#include <string>

#include "bundled/json.hpp"

namespace ae
{
namespace config
{


enum Directory
{
  DIR_ROOT,
  DIR_BIN,
  DIR_LOGS,
  DIR_LIB
};

/**
 *
 * get["root"] - priečinok
 *
 * get["name"] - názov aplikácie
 *
 * get["servers"] - pole
 * get[""] -
 *
 * get["playgrounds"] - pole
 * get["playground"]["resolution"] - pole
 * get["playground"]
 * get[""] -
 * get[""] -
 * get["agents"] -
 * get[""] -
 * get[""] -
 * get[""] -
 * get["agent_bodies"] -
 * get[""] -
 * get[""] -
 * get[""] -
 *
 */
extern const nlohmann::json &get;


int setup(const char *app_name, int argc, char *argv[]);

std::string path(const Directory base_dir, const std::string &file);

const std::string server_ud_path();
const std::string server_ip_addr();
int server_port();

uint16_t agent_type_from_name(const std::string &name);



void set_configuration_storage(nlohmann::json *conf);
std::shared_ptr<nlohmann::json> get_configuration_storage();


void set_configuration(const nlohmann::json &conf);

} /* namespace Config */
} /* namespace ae */


#endif /* _CONFIG_H_ */
