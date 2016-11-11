#include <string>

#include "logging.h"

INITIALIZE_EASYLOGGINGPP


void logging_init(const char *app_name, int argc, char *argv[])
{
  START_EASYLOGGINGPP(argc, argv);
  
  el::Configurations log_conf;
  std::string fmt = "%datetime %level [";
  fmt += app_name;
  fmt += "] [%thread] [%fbase:%line] %msg";
  
  log_conf.setGlobally(el::ConfigurationType::Format, fmt.c_str());
  log_conf.setGlobally(el::ConfigurationType::ToFile, "false");
  log_conf.setGlobally(el::ConfigurationType::ToStandardOutput, "true");
  
  el::Loggers::reconfigureAllLoggers(log_conf);
}