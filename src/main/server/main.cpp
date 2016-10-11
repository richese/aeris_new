#include "../common/common.h"

int main()
{
  printf("size = %lu\n", sizeof(struct sAgentInterface));

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
