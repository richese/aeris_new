#include "client.h"

#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h>


#include "getch.h"
#include "debug.h"
#include "configure.h"



extern class CConfigure g_configure;

CClient::CClient(struct sAgentGroupInitStruct agent_group_init_struct, class CAgent *agent, class CVisualisationDummy *visualisation):CAgentGroup(agent_group_init_struct, agent)
{
//  visualisation = new CVisualisation();
  this->visualisation = visualisation;

  connection_state = CLIENT_CONNECTION_STATE_NO_CONNECTED;
  connection_method = USE_AF_UNIX|USE_AF_INET;
  sockfd = -1;
}

CClient::~CClient()
{
  if (connection_state == CLIENT_CONNECTION_STATE_CONNECTED)
    close(sockfd);

  // delete visualisation;
}

void CClient::set_connection_method(int address_family)
{
  connection_method = address_family & (USE_AF_UNIX|USE_AF_INET);
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

    if (visualisation != NULL)
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
        close(sockfd);
        sockfd = -1;

        if (connection_method & USE_AF_UNIX)
        {
          if ((sockfd = connect_to_unix_domain_server()) < 0 && !(connection_method & USE_AF_INET))
          {
            return -1;
          }
        }
        if (sockfd == -1 && (connection_method & USE_AF_INET))
        {
          if ((sockfd = connect_to_inet_server()) < 0)
          {
            return -2;
          }
        }
        connection_state = CLIENT_CONNECTION_STATE_CONNECTED;
      }

      //printf("sending\n");

      do
      {
        ptr = (ptr+1)%agent_interface.size();
      }
        while ( (agent_interface[ptr].group_id != get_group_id()) || (agent_interface[ptr].id == 0) );

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

int CClient::connect_to_unix_domain_server()
{
  int unix_sockfd = -1;
  struct sockaddr_un serv_unix_addr;
  memset(&serv_unix_addr, 0, sizeof(serv_unix_addr));
  serv_unix_addr.sun_family = AF_UNIX;
  strcpy(serv_unix_addr.sun_path, g_configure.get_server_ud_path());
  int addr_len = strlen(serv_unix_addr.sun_path) + sizeof(serv_unix_addr.sun_family);

  if ((unix_sockfd = socket(AF_UNIX, SOCK_STREAM, 0)) < 0)
  {
    printf("ERROR opening unix socket: %s\n", strerror(errno));
    close(unix_sockfd);
    return -1;
  }
  if (connect(unix_sockfd, (struct sockaddr *)&serv_unix_addr, addr_len) < 0)
  {
    close(sockfd);
    printf("ERROR failed to connect to unix domain socket\n");
    return -1;
  }

  return unix_sockfd;
}

int CClient::connect_to_inet_server()
{
  int inet_sockfd = -1;
  struct sockaddr_in serv_addr;
  memset(&serv_addr, 0, sizeof(serv_addr));
  int portno = g_configure.get_server_port();
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = inet_addr(g_configure.get_server_ip());
  serv_addr.sin_port = htons(portno);

  if ((inet_sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
  {
    printf("ERROR opening inet socket: %s\n", strerror(errno));
    close(inet_sockfd);
    return -1;
  }
  if (connect(inet_sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
  {
    close(sockfd);
    printf("ERROR failed to connect to inet socket\n");
    return -1;
  }

  return inet_sockfd;
}
