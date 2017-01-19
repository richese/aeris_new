#include <iostream>

#include "common/agent_server.h"
#include "common/config.h"
#include "common/logging.h"
#include "common/timing.h"


using namespace ae;


int main(int argc, char *argv[])
{
  config::setup("server", argc, argv);

  Server *server = new Server();

  server->main();

  delete server;

  LOG(INFO) << "Exiting";
  return 0;
}
