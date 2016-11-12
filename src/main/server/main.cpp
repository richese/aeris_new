#include <memory>

#include <unistd.h>

#include "../common/logging.h"
#include "../common/server.h"
#include "../common/signals.h"


int main(int argc, char *argv[])
{
  logging_init("server", argc, argv);

  std::shared_ptr<CServer> server(new CServer);
  if (!server)
  {
    LOG(ERROR) << "Failed to allocate server instance.";
    return 1;
  }

  if (server->listen(CServer::USE_AF_INET|CServer::USE_AF_UNIX) < 0)
  {
    LOG(ERROR) << "Failed to open server sockets.";
    return 1;
  }

  LOG(INFO) << "Started.";
  while (!received_exit_signal())
  {
    sleep(1);
  }

  LOG(INFO) << "Program done. Cleaning up.";
  return 0;
}
