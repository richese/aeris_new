#include "../common/common.h"

int main()
{
  class CServer *server = new CServer();

  if (server->listen(CServer::USE_AF_INET|CServer::USE_AF_UNIX) < 0)
  {
    delete server;
    return 1;
  }

  printf("server started, press ESC to end\n");
  while (getch() != 27)
  {
    sleep(1);
  }

  delete server;

  printf("program done\n");
  return 0;
}
