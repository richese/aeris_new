#include <iostream>

#include "common/config.h"
#include "common/logging.h"
#include "common/timing.h"


int main(int argc, char *argv[])
{
  ae::config::setup("test", argc, argv);

  // ae::config::load("../../../config/config.json");
  // // std::cout << std::setw(2) << ae::config::get << std::endl;
  // auto ud_path = ae::config::get["servers"][0]["ud_path"];
  // if (ud_path.is_string())
  // {
  //   std::cout << ud_path << std::endl;
  // }
  //
  // for (int i=0; i < 20; i++)
  // {
  //   LOG(INFO) << ae::time::timestamp();
  //   ae::time::sleep_for(ae::time::milliseconds(1000));
  // }

  return 0;
}
