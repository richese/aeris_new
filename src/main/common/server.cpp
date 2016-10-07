#include "server.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include "debug.h"
#include "configure.h"
#include "ms_time.h"

extern CConfigure g_configure;

CServer::CServer()
{
  sockfd = socket(AF_INET, SOCK_STREAM, 0);

  if (sockfd < 0)
     printf("ERROR opening socket\n");

  struct sockaddr_in serv_addr;
  bzero((char *) &serv_addr, sizeof(serv_addr));

  int portno = g_configure.get_server_port();
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = INADDR_ANY;
  serv_addr.sin_port = htons(portno);

  if (bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
      printf("ERROR on binding");


  server_thread = new std::thread(&CServer::server_thread_func, this);

  #ifdef _DEBUG_COMMON_
  printf("%lu : server created\n", (unsigned long int)this);
  #endif
}

CServer::~CServer()
{
  if (server_thread != NULL)
  {
    server_thread->join();
    delete server_thread;

    server_thread = NULL;
  }

  close(sockfd);

  #ifdef _DEBUG_COMMON_
  printf("%lu : server destroyed\n", (unsigned long int)this);
  #endif
}

void CServer::server_thread_func()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : server main loop started\n", (unsigned long int)this);
  #endif

  while (run)
  {
    listen(sockfd, 5);

    struct sockaddr_in cli_addr;
    socklen_t clilen = sizeof(cli_addr);
    client_fd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);

    if (client_fd < 0)
    {
      #ifdef _ERROR_COMMON_
      printf("ERROR on accept");
      #endif
    }
    else
    {
      #ifdef _INFO_COMMON_
      printf("new client connected with fd %i\n", client_fd);
      #endif

      client_thread.push_back(new std::thread(&CServer::client_thread_func, this, client_fd));
    }
  }

  #ifdef _DEBUG_COMMON_
  printf("%lu : server main loop ended\n", (unsigned long int)this);
  #endif
}


void CServer::client_thread_func(int client_fd)
{
  struct sAgentInterface agent_interface_tmp;

  #ifdef _DEBUG_COMMON_
  printf("connection accecpt client fd %i\n", client_fd);
  #endif

  int error = 0;
  socklen_t len = sizeof (error);

  unsigned int ptr = 0;

  while (1)
  {
    int retval = getsockopt (client_fd, SOL_SOCKET, SO_ERROR, &error, &len);
    if (retval != 0)
      break;

    int read_res = read(client_fd, (char*)(&agent_interface_tmp),  sizeof(struct sAgentInterface));
    if (read_res <= 0)
      break;

    mutex_agent_interface.lock();
    if (agent_interface_tmp.id != 0)
    {
      unsigned int j;
      int idx = -1;
      for (j = 0; j < agent_interface.size(); j++)
      {
        if (agent_interface[j].id == agent_interface_tmp.id)
        {
          idx = j;
          break;
        }
      }

      if (idx == -1)
      {
        for (j = 0; j < agent_interface.size(); j++)
          if (agent_interface[j].id == 0)
          {
            idx = j;
            break;
          }
      }


      if (idx == -1)
      {
        agent_interface.push_back(agent_interface_tmp);
      }
      else
        agent_interface[idx] = agent_interface_tmp;
    }

    do
    {
      agent_interface_tmp = agent_interface[ptr];
      ptr = (ptr + 1)%agent_interface.size();
    }
      while (agent_interface_tmp.id == 0);


    mutex_agent_interface.unlock();

    int write_res = write(client_fd, (char*)(&agent_interface_tmp), sizeof(struct sAgentInterface));
    if (write_res <= 0)
      break;
  }

  #ifdef _DEBUG_COMMON_
  printf("connection %i ended with error %i\n", client_fd, error);
  #endif
}
