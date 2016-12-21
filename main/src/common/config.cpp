#include <cmath>
#include <cstdlib>

#include <exception>
#include <fstream>
#include <iostream>
#include <string>

#include <getopt.h>
#include <unistd.h>

#include "bundled/json.hpp"

#include "config.h"
#include "logging.h"


using json = nlohmann::json;


INITIALIZE_EASYLOGGINGPP


namespace
{

/** Objekt obsahujúci celý načítaný json konfiguračný súbor. */
json configuration = json::object();

/** Zoznam krátkych argumentov pre getopt. */
const char * short_opts = "hr:c:n:s:g:vp";

/** Zoznam dlhých argumentov pre getopt. */
const struct option long_opts[] =
{
  {"help",             0, nullptr, 'h'},
  {"root",             1, nullptr, 'r'},
  {"config",           1, nullptr, 'c'},
  {"name",             1, nullptr, 'n'},
  {"server",           1, nullptr, 's'},
  {"playground",       1, nullptr, 'g'},
  /* easyloggingc++ options to ignore by getopt */
  {"v",                1, nullptr, 'v'},
  {"verbose",          0, nullptr, 'v'},
  {"vmodule",          1, nullptr, 'v'},
  {"logging-flags",    1, nullptr, 'v'},
  {"default-log-file", 1, nullptr, 'v'},
  {nullptr,            0, nullptr,  0 }
};

/** šírka názvu programu v logoch pre zarovnanie */
const int log_name_padding = 13;

/** názov programu použitý v logoch pomocou %name */
std::string log_name = "undefined";


void print_usage(char *cmd)
{
  using std::cerr;
  using std::endl;

  cerr << "Usage: " << cmd << " [OPTION...]" << endl;
  cerr << endl;
  cerr << "  -h, --help                  print this help list" << endl;
  cerr << endl;
  cerr << "Agent group options:" << endl;
  cerr << "  -r, --root=PATH             specify environment root path" << endl;
  cerr << "  -c, --config=FILE           use custom configuration file instead of \"$ROOT/config/config.json\"" << endl;
  cerr << "  -n, --name=NAME             use this group name instead of the default name" << endl;
  cerr << "  -s  --server=NAME           use this server (default: \"local\")" << endl;
  cerr << "  -g  --playground=NAME       use this playground (default: \"testing\")" << endl;
  cerr << endl;
  cerr << "Easyloggingc++ options:" << endl;
  cerr << "  -v, --verbose               activates maximum verbosity" << endl;
  cerr << "      --v=N                   activates verbosity up to verbose level N (valid range: 0-9)" << endl;
  cerr << "      --vmodule=MODULE_NAME   activates verbosity in some complicated way..." << endl;
  cerr << "  -p                          disable performance tracking" << endl;
  cerr << "      --logging-flags=N       sets logging flags" << endl;
  cerr << "      --default-log-file=FILE sets default log file for existing and future loggers" << endl;
  cerr << endl;
  cerr << "  More details at: https://github.com/easylogging/easyloggingpp#application-arguments" << endl;
  cerr << endl;
}


int parse_arguments(int argc, char *argv[], json &options)
{
  while (true)
  {
    int opt;
    if ((opt = getopt_long(argc, argv, short_opts, long_opts, nullptr)) < 0)
    {
      break;
    }

    switch (opt)
    {
      case 'h':
        print_usage(argv[0]);
        return -1;

      case 'r':
        options["root"] = optarg;
        break;

      case 'c':
        options["config"] = optarg;
        break;

      case 'n':
        options["name"] = optarg;
        break;

      case 's':
        options["server"] = optarg;
        break;

      case 'g':
        options["playground"] = optarg;
        break;

      case 'v':
        break;

      case 'p':
        options["performance_tracking"] = "false";
        break;

      default:
        std::cerr << "Invalid argument." << std::endl;
        print_usage(argv[0]);
        return -1;
    }
  }

  if (optind < argc)
  {
    std::cerr << "Invalid argument." << std::endl;
    print_usage(argv[0]);
    return -1;
  }

  return 0;
}


void set_log_name(const std::string &name)
{
  std::string tmp = name;

  while (tmp.length() < log_name_padding)
  {
    tmp.insert(tmp.begin(), ' ');
    tmp += ' ';
  }
  tmp.resize(log_name_padding);

  log_name = tmp;
}


const char* get_log_name()
{
  return log_name.c_str();
}


void setup_logging(int argc, char *argv[], const json &options)
{
  using namespace el;

  START_EASYLOGGINGPP(argc, argv);

  set_log_name(options["name"]);
  Helpers::installCustomFormatSpecifier(CustomFormatSpecifier("%name", get_log_name));

  // configure 'default' logger
  Configurations conf;

  std::string log_file = options["root"];
  log_file += "/logs/";
  log_file += options["name"];
  log_file += "-";
  log_file += std::to_string(getpid());
  log_file += ".log";

  conf.setToDefault();
  conf.setGlobally(ConfigurationType::Enabled,             "true");
  conf.setGlobally(ConfigurationType::ToFile,              "true");
  conf.setGlobally(ConfigurationType::ToStandardOutput,    "true");
  conf.setGlobally(ConfigurationType::Format,              "%datetime %levshort [%name] %msg");
  conf.setGlobally(ConfigurationType::Filename,            log_file);
  conf.setGlobally(ConfigurationType::PerformanceTracking, options["performance_tracking"]);

  conf.set(Level::Debug, ConfigurationType::Format,        "%datetime %levshort [%name] [%fbase:%line] %msg");

  Loggers::reconfigureLogger("default", conf);
  VLOG(4) << "Using \"default\" logfile: " << log_file;

  // configure 'performance' logger
  log_file = options["root"];
  log_file += "/logs/";
  log_file += options["name"];
  log_file += "-performance-";
  log_file += std::to_string(getpid());
  log_file += ".log";

  conf.setToDefault();
  conf.setGlobally(ConfigurationType::Enabled,          options["performance_tracking"]);
  conf.setGlobally(ConfigurationType::ToFile,           "true");
  conf.setGlobally(ConfigurationType::ToStandardOutput, "false");
  conf.setGlobally(ConfigurationType::Filename,         log_file);

  Loggers::reconfigureLogger("performance", conf);
  VLOG(4) << "Using \"performance\" logfile: " << log_file;
}


int validate_config(const json &config)
{
  const std::string err_msg = "Config validation error: ";

  try
  {
    if (!config.is_object())
    {
      LOG(ERROR) << err_msg << "Config root is not an object";
      return -1;
    }
  }
  catch (const std::exception &e)
  {
    LOG(ERROR) << err_msg << "json error:" << e.what();
    return -1;
  }

  return 0;
}


void calculate_playground_size(json &playground)
{
  double w_px = playground["resolution"][0];
  double h_px = playground["resolution"][1];
  double diag_cm = 2.54 * playground["diagonal"].get<double>();
  double cm = diag_cm / sqrt(w_px * w_px + h_px * h_px);
  double w = w_px * cm;
  double h = h_px * cm;

  playground["w"] = w;
  playground["h"] = h;
  playground["cm"] = cm;
}


} /* namespace */


/** Verejný read-only odkaz na celú konfiguráciu. */
const json &ae::config::get = ::configuration;


int ae::config::setup(const char *app_name, int argc, char *argv[])
{
  json options;

  // nastav defaultne hodnoty argumentov
  const char *env_root_dir = std::getenv("MAIN_ROOT_DIR");
  if (env_root_dir != nullptr)
  {
    options["root"] = env_root_dir;

    std::string default_config = env_root_dir;
    default_config += "/config/config.json";
    options["config"] = default_config;
  }
  else
  {
    options["root"] = "..";
    options["config"] = "../config/config.json";
  }
  options["name"] = app_name;
  options["server"] = "local";
  options["playground"] = "testing",
  options["performance_tracking"] = "true";

  // nacitaj argumenty
  if (parse_arguments(argc, argv, options) < 0)
  {
    return -1;
  }

  // nastav loogovanie
  setup_logging(argc, argv, options);
  VLOG(3) << "Using root directory: " << options["root"];

  // načítaj konfiguračný súbor
  std::ifstream f(options["config"], std::ifstream::in);
  if (!f.is_open() || !f)
  {
    LOG(ERROR) << "Error opening config file: " << options["config"];
    return -1;
  }

  json config;
  try
  {
    config = json::parse(f);
  }
  catch (const std::exception &e)
  {
    LOG(ERROR) << "Config file parsing error: " << e.what();
    return -1;
  }

  if (validate_config(config) < 0)
  {
    return -1;
  }

  config["root"] = options["root"];
  config["name"] = options["name"];

  // vyber server zo zoznamu serverov
  auto server = config["server_list"].find(options["server"]);
  if (server == config["server_list"].end())
  {
    LOG(ERROR) << "Server list is missing server " << options["server"] << ". Check your config.";
    return -1;
  }
  config["server"] = *server;

  // vyber hraciu plochu zo zoznamu
  auto playground = config["playground_list"].find(options["playground"]);
  if (playground == config["playground_list"].end())
  {
    LOG(ERROR) << "Playground list is missing playground " << options["playground"] << ". Check your config.";
    return -1;
  }
  calculate_playground_size(*playground);
  config["playground"] = *playground;

  // nakopiruj nacitanu konfiguraciu do globalnej premennej
  configuration = config;

  return 0;
}


std::string ae::config::path(const Directory base_dir, const std::string &file)
{
  std::string tmp = get["root"];

  switch (base_dir)
  {
    case DIR_ROOT:
      break;

    case DIR_BIN:
      tmp += "/bin";
      break;

    case DIR_LOGS:
      tmp += "/logs";
      break;

    case DIR_LIB:
      tmp += "/lib";
      break;
  }

  tmp += '/';
  tmp += file;
  return tmp;
}



const std::string ae::config::server_ud_path()
{
  // auto ud_path = get["servers"][0]["ud_path"];
  // if (ud_path.is_string())
  // {
  //   return ud_path;
  // }
  return std::string();
}

const std::string ae::config::server_ip_addr()
{
  // auto ip = get["servers"][0]["ip"];
  // if (ip.is_string())
  // {
  //   return ip;
  // }
  return std::string();
}

int ae::config::server_port()
{
  // auto port = get["servers"][0]["port"];
  // if (port.is_number_unsigned())
  // {
  //   return port;
  // }
  return -1;
}


void ae::config::set_configuration(const nlohmann::json &conf)
{
  configuration = conf;
}
