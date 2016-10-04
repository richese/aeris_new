#include <client.h>

#include <getch.h>
#include <debug.h>

#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#include <configure.h>
extern class CConfigure g_configure;


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
  printf("struct size : %lu\n", sizeof(agent_interface));
  /*
  struct sAgentInterface agent_interface_tmp;

  if (connection_state == CLIENT_CONNECTION_STATE_NO_CONNECTED)
  {
    sockfd = 0;
    sockaddr_in serv_addr;

    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
        return -1;

    serv_addr.sin_addr.s_addr = inet_addr(g_configure.get_server_ip());
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(g_configure.get_server_port());

    if( connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    {
      close(sockfd);
      connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
      return -3;
    }

    connection_state = CLIENT_CONNECTION_STATE_CONNECTED;
  }


  if( send(sockfd, (char*)agent_interface_tmp, sAgentInterfaceSIZE, 0) < 0)
  {
    close(sockfd);
    connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
    return -5;
  }

  if( recv(sockfd, (char*)&agent_interface_tmp, sAgentInterfaceSIZE, 0) < 0)
  {
    close(sockfd);
    connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
    return -6;
  }
*/
  // close(sockfd);
  return 0;
}
