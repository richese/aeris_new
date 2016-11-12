#include <string>
#include <thread>

#include <unistd.h>

#include "logging.h"


INITIALIZE_EASYLOGGINGPP

const int kAppNameLength = 13;
std::string g_app_name = "unknown";


void set_app_name(const char *name)
{
  std::string tmp = name;
  
  while (tmp.length() < kAppNameLength)
  {
    tmp.insert(tmp.begin(), ' ');
    tmp += ' ';
  }
  tmp.resize(kAppNameLength);
  g_app_name = tmp;
}

const char * get_app_name()
{
  return g_app_name.c_str();
}

void logging_init(const char *app_name, int argc, char *argv[])
{
  START_EASYLOGGINGPP(argc, argv);
  
  set_app_name(app_name);
  el::Helpers::installCustomFormatSpecifier(el::CustomFormatSpecifier("%name", get_app_name));

  std::string log_file = "../logs/";
  log_file += app_name;
  log_file += "-";
  log_file += std::to_string(getpid());
  log_file += ".log";

  el::Configurations conf("../../log.config");
  conf.setGlobally(el::ConfigurationType::Filename, log_file.c_str());
  el::Loggers::reconfigureLogger("default", conf);
  
  log_file = "../logs/";
  log_file += app_name;
  log_file += "-performance-";
  log_file += std::to_string(getpid());
  log_file += ".log";
  conf.setGlobally(el::ConfigurationType::Filename, log_file.c_str());
  conf.setGlobally(el::ConfigurationType::ToStandardOutput, "false");
  el::Loggers::reconfigureLogger("performance", conf);
}