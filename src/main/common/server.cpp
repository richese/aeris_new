#include "server.h"

#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <errno.h>
#include <unistd.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/un.h>
#include <netinet/in.h>

#include "debug.h"
#include "configure.h"
#include "ms_time.h"

extern CConfigure g_configure;

CServer::CServer()
{
  server_thread = NULL;

  unix_sockfd = -1;
  inet_sockfd = -1;
  FD_ZERO(&open_sockets);

  #ifdef _DEBUG_COMMON_
  printf("%lu : server created\n", (unsigned long int)this);
  #endif
}

CServer::~CServer()
{
  run = false;

  if (server_thread != NULL)
  {
    server_thread->join();
    delete server_thread;

    server_thread = NULL;
  }

  close(unix_sockfd);
  close(inet_sockfd);

  #ifdef _DEBUG_COMMON_
  printf("%lu : server destroyed\n", (unsigned long int)this);
  #endif
}

int CServer::listen(const int addres_family)
{
  if (addres_family & USE_AF_UNIX && open_unix_domain_socket() < 0)
  {
    return -1;
  }
  if (addres_family & USE_AF_INET && open_inet_socket() < 0)
  {
    return -1;
  }

  server_thread = new std::thread(&CServer::server_thread_func, this);

  return 0;
}

int CServer::open_unix_domain_socket()
{
  if (unix_sockfd != -1)
  {
    printf("WARNING unix socket is already open\n");
    return 0;
  }

  struct sockaddr_un serv_unix_addr;
  memset(&serv_unix_addr, 0, sizeof(serv_unix_addr));
  serv_unix_addr.sun_family = AF_UNIX;
  strcpy(serv_unix_addr.sun_path, g_configure.get_server_ud_path());
  int addr_len = strlen(serv_unix_addr.sun_path) + sizeof(serv_unix_addr.sun_family);

  if ((unix_sockfd = socket(AF_UNIX, SOCK_STREAM, 0)) < 0)
  {
    printf("ERROR opening unix socket: %s\n", strerror(errno));
    close(unix_sockfd);
    unix_sockfd = -1;
    return -1;
  }
  if (unlink(serv_unix_addr.sun_path) < 0 && errno != ENOENT)
  {
    printf("ERROR unlinking old unix socket file failed: %s\n", strerror(errno));
    close(unix_sockfd);
    unix_sockfd = -1;
    return -1;
  }
  if (bind(unix_sockfd, (struct sockaddr *) &serv_unix_addr, addr_len))
  {
    printf("ERROR binding unix socket: %s\n", strerror(errno));
    close(unix_sockfd);
    unix_sockfd = -1;
    return -1;
  }
  if (::listen(unix_sockfd, 5) < 0)
  {
    printf("ERROR unable to listen on unix socket: %s\n", strerror(errno));
    close(unix_sockfd);
    unix_sockfd = -1;
    return -1;
  }

  FD_SET(unix_sockfd, &open_sockets);

  #ifdef _DEBUG_COMMON_
  printf("%lu: Opened unix domain socket at %s\n", (unsigned long int)this, serv_unix_addr.sun_path);
  #endif
  return 0;
}

int CServer::open_inet_socket()
{
  if (inet_sockfd != -1)
  {
    printf("WARNING inet socket is already open\n");
    return 0;
  }

  struct sockaddr_in serv_addr;
  memset(&serv_addr, 0, sizeof(serv_addr));
  int portno = g_configure.get_server_port();
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = INADDR_ANY;
  serv_addr.sin_port = htons(portno);

  if ((inet_sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
  {
    printf("ERROR opening inet socket: %s\n", strerror(errno));
    close(inet_sockfd);
    inet_sockfd = -1;
    return -1;
  }
  if (bind(inet_sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
  {
    printf("ERROR binding inet socket: %s\n", strerror(errno));
    close(inet_sockfd);
    inet_sockfd = -1;
    return -1;
  }
  if (::listen(inet_sockfd, 5) < 0)
  {
    printf("ERROR unable to listen on inet socket: %s\n", strerror(errno));
    close(inet_sockfd);
    inet_sockfd = -1;
    return -1;
  }

  FD_SET(inet_sockfd, &open_sockets);

  #ifdef _DEBUG_COMMON_
  printf("%lu: Opened inet socket at port %d\n", (unsigned long int)this, portno);
  #endif
  return 0;
}

void CServer::server_thread_func()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : server main loop started\n", (unsigned long int)this);
  #endif

  while (run)
  {
    fd_set fd_ready_to_read = open_sockets;
    struct timeval timeout = {1, 0}; // 1s

    if (select(FD_SETSIZE, &fd_ready_to_read, NULL, NULL, &timeout) < 0)
    {
      #ifdef _ERROR_COMMON_
      printf("ERROR while waiting for socket activity: %s\n", strerror(errno));
      #endif
      continue;
    }

    if (unix_sockfd != -1 && FD_ISSET(unix_sockfd, &fd_ready_to_read))
    {
      int client_fd;
      struct sockaddr_un client_addr;
      socklen_t client_addr_len = sizeof(client_addr);

      if ((client_fd = accept(unix_sockfd, (struct sockaddr *) &client_addr, &client_addr_len)) < 0)
      {
        #ifdef _ERROR_COMMON_
        printf("ERROR on unix domain accept: %s\n", strerror(errno));
        #endif
      }
      else
      {
        #ifdef _INFO_COMMON_
        printf("new unix domain client connected with fd %i\n", client_fd);
        #endif

        client_thread.push_back(new std::thread(&CServer::client_thread_func, this, client_fd));
      }
    }

    if (inet_sockfd != -1 && FD_ISSET(inet_sockfd, &fd_ready_to_read))
    {
      int client_fd;
      struct sockaddr_in client_addr;
      socklen_t client_addr_len = sizeof(client_addr);

      if ((client_fd = accept(inet_sockfd, (struct sockaddr *) &client_addr, &client_addr_len)) < 0)
      {
        #ifdef _ERROR_COMMON_
        printf("ERROR on inet accept: %s\n", strerror(errno));
        #endif
      }
      else
      {
        #ifdef _INFO_COMMON_
        printf("new inet client connected with fd %i\n", client_fd);
        #endif

        client_thread.push_back(new std::thread(&CServer::client_thread_func, this, client_fd));
      }
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
