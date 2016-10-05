#include "../common/common.h"

int main()
{
  class CServer *server = new CServer();


  printf("server started, press ESC to end\n");
  while (getch() != 27)
  {
    sleep(1);
  }

  delete server;

  printf("program done\n");
  return 0;
}
