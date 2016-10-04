#include <client_local.h>

#include <getch.h>
#include <debug.h>

CClientLocal::CClientLocal(struct sAgentGroupInitStruct agent_group_init_struct):CAgentGroup(agent_group_init_struct)
{
  visualisation = new CVisualisation();
}


CClientLocal::~CClientLocal()
{
  delete visualisation;
}


int CClientLocal::main()
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

int CClientLocal::connect()
{
  // visualisation_refresh_data(&agent_interface);
  return -1;
}
