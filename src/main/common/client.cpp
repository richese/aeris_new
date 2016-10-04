#include <client.h>

#include <getch.h>
#include <debug.h>

#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>


CClient::CClient(struct sAgentGroupInitStruct agent_group_init_struct):CAgentGroup(agent_group_init_struct)
{
  visualisation = new CVisualisation();
  connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
}


CClient::~CClient()
{
  delete visualisation;
}


int CClient::main()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : client local main loop started, press ESC to end\n", (unsigned int long)this);
  #endif


  rt_timer_start();

  while (getch() != 27)
  {
    rt_timer_delay_ms(100.0);
    #ifdef _DEBUG_COMMON_
    printf("%lu : client local main loop running, press ESC to end\n", (unsigned int long)this);
    #endif

    visualisation->refresh(&agent_interface);
  }

  rt_timer_stop();

  return 0;
}

int CClient::connect()
{
  printf("connect\n");
  // visualisation_refresh_data(&agent_interface);
  return -1;
}
