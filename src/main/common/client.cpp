#include "client.h"

#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h>


#include "getch.h"
#include "debug.h"
#include "configure.h"




extern class CConfigure g_configure;

CClient::CClient(struct sAgentGroupInitStruct agent_group_init_struct, class CAgent *agent):CAgentGroup(agent_group_init_struct, agent)
{
  visualisation = new CVisualisation();
  connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
}

CClient::~CClient()
{
  if (connection_state == CLIENT_CONNECTION_STATE_CONNECTED)
    close(sockfd);

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

int CClient::connect_to_server()
{
  struct sAgentInterface agent_interface_tmp;

    unsigned int j;
    unsigned int ptr = 0;
    for (j = 0; j < agent_interface.size(); j++)
    {
      if (connection_state == CLIENT_CONNECTION_STATE_NO_CONNECTED)
      {
        sockfd = 0;
        sockaddr_in serv_addr;

        //printf("opening\n");

        if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
        {
          connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
          return -1;
        }

        serv_addr.sin_addr.s_addr = inet_addr(g_configure.get_server_ip());
        serv_addr.sin_family = AF_INET;
        serv_addr.sin_port = htons(g_configure.get_server_port());

        //printf("connecting\n");

        if( connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        {
          close(sockfd);
          connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
          return -2;
        }

        connection_state = CLIENT_CONNECTION_STATE_CONNECTED;
      }

      //printf("sending\n");

      do
      {
        ptr = (ptr+1)%agent_interface.size();
      }
        while (agent_interface[ptr].group_id != get_group_id());

      agent_interface_tmp = agent_interface[ptr];

      if( send(sockfd, (char*)(&agent_interface_tmp), sizeof(struct sAgentInterface), 0) <= 0)
      {
        close(sockfd);
        connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
        return -3;
      }

      //printf("receiving\n");

      agent_interface_tmp.id = 0;
      if( recv(sockfd, (char*)(&agent_interface_tmp), sizeof(struct sAgentInterface), 0) <= 0)
      {
        close(sockfd);
        connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
        return -4;
      }

      // printf("readed agent with id %u\n", agent_interface_tmp.id);


      unsigned int i;

      int idx = -1;
      for (i = 0; i < agent_interface.size(); i++)
      {
        if (agent_interface_tmp.id == agent_interface[i].id)
        {
          idx = i;
          break;
        }
      }

      if (idx == -1)
        agent_interface.push_back(agent_interface_tmp);
      else
      {
        if (
            (agent_interface_tmp.robot_time > agent_interface[idx].robot_time) ||
            (agent_interface_tmp.group_id != get_group_id())
          )
            agent_interface[idx] = agent_interface_tmp;
      }

    }


  return 0;
}
