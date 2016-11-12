#include <cstring>

#include <memory>

#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>

#include "client.h"
#include "configure.h"
#include "logging.h"
#include "signals.h"
#include "socket.h"


extern class CConfigure g_configure;


CClient::CClient(sAgentGroupInitStruct agent_group_init_struct,
                 CAgent *agent,
                 CVisualisationDummy *visualisation) :
  CAgentGroup(agent_group_init_struct, agent),
  visualisation(visualisation),
  connection_state(NOT_CONNECTED),
  connection_method(METHOD_UNIX|METHOD_INET),
  socket(nullptr)
{

}

CClient::~CClient()
{

}

void CClient::set_connection_method(int methods)
{
  connection_method = methods & (METHOD_UNIX|METHOD_INET);
}

int CClient::main()
{
  VLOG(2) << "Client main loop started.";

  rt_timer_start();

  while (!received_exit_signal())
  {
    rt_timer_delay_ms(100.0);
    VLOG_EVERY_N(10, 3) << "Client loop running.";

    if (visualisation != NULL)
      visualisation->refresh(&agent_interface);
  }

  rt_timer_stop();

  VLOG(2) << "Client main loop stopped.";
  return 0;
}

int CClient::connect_to_server()
{
  TIMED_FUNC(connection_benchmark);

  struct sAgentInterface agent_interface_tmp;
  unsigned int ptr = 0;

  for (unsigned int j = 0; j < agent_interface.size(); j++)
  {
    /* establish connection */
    if (connection_state == NOT_CONNECTED)
    {
      if (socket)
      {
        LOG(WARNING) << "Lost connection to server " << *socket;
      }

      if (connection_method & METHOD_UNIX)
      {
        socket = std::shared_ptr<Socket>(new Socket(g_configure.get_server_ud_path()));
        if (!socket)
        {
          return -1;
        }
        if (socket->connect() < 0 && !(connection_method & METHOD_INET))
        {
          socket = std::shared_ptr<Socket>(nullptr);
          return -1;
        }
        connection_state = IS_CONNECTED;
      }
      if (connection_state == NOT_CONNECTED)
      {
        socket = std::shared_ptr<Socket>(new Socket(g_configure.get_server_ip(), g_configure.get_server_port()));
        if (!socket)
        {
          return -1;
        }
        if (socket->connect() < 0)
        {
          return -1;
        }
        connection_state = IS_CONNECTED;
      }
      VLOG(2) << "Connected to server " << *socket;
    }
    int fd = socket->fd();

    /* sending */
    do
    {
      ptr = (ptr + 1) % agent_interface.size();
    }
    while ( (agent_interface[ptr].group_id != get_group_id()) || (agent_interface[ptr].id == 0) );

    agent_interface_tmp = agent_interface[ptr];

    if( send(fd, (char*)(&agent_interface_tmp), sizeof(struct sAgentInterface), 0) <= 0)
    {
      connection_state = NOT_CONNECTED;
      return -3;
    }

    /* receiving */
    agent_interface_tmp.id = 0;
    if(recv(fd, (char*)(&agent_interface_tmp), sizeof(struct sAgentInterface), 0) <= 0)
    {
      connection_state = NOT_CONNECTED;
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
