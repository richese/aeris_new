#include <cstdlib>
#include <cstring>
#include <memory>

#include <sys/socket.h>
#include <unistd.h>

#include "../common/configure.h"
#include "../common/logging.h"
#include "../common/ms_time.h"
#include "../common/socket.h"

#include "agent_server.h"

extern CConfigure g_configure;

AgentServer::AgentServer() :
  CAgentGroup(),
  server_thread(nullptr),
  client_threads(),
  finished_threads(),
  sockets()
{
  VLOG(9) << "AgentServer constructor.";
}

AgentServer::~AgentServer()
{
  run = false;

  if (server_thread)
  {
    server_thread->join();
  }
  for (auto &thread : client_threads)
  {
    thread.join();
  }

  VLOG(9) << "Server destructor.";
}

int AgentServer::listen(const int addres_family)
{
  if (addres_family & USE_AF_UNIX)
  {
    Socket *sock = new Socket(g_configure.get_server_ud_path());
    if (!sock || sock->listen(5) < 0)
    {
      return -1;
    }
    sockets.add_socket(std::shared_ptr<Socket>(sock));
  }
  if (addres_family & USE_AF_INET)
  {
    Socket *sock = new Socket(g_configure.get_server_ip(), g_configure.get_server_port());
    if (!sock || sock->listen(5) < 0)
    {
      return -1;
    }
    sockets.add_socket(std::shared_ptr<Socket>(sock));
  }

  std::thread *t = new std::thread(&AgentServer::server_thread_func, this);
  server_thread = std::shared_ptr<std::thread>(t);

  return 0;
}

void AgentServer::server_thread_func()
{
  VLOG(2) << "Server main loop started.";

  while (run)
  {
    /* handle communication requests */
    std::shared_ptr<Socket> sock = sockets.select(1000);
    if (sock)
    {
      switch (sock->type())
      {
        default:
        {
          LOG(ERROR) << "Invalid socket in SocketWatch " << *sock;
          sockets.del_socket(sock->fd());
        } break;

        /* accept connection from new client */
        case Socket::TYPE_SERVER:
        {
          std::shared_ptr<Socket> client = sock->accept();
          if (client)
          {
            client_threads.emplace_back(&AgentServer::client_threads_func, this, client);
            // sockets.add_socket(client);
          }
        } break;

        /* handle request from an existing client */
        case Socket::TYPE_ACCEPT:
        {
          // start thread for client request
          // sockets.del_socket(sock->fd());
          // std::future<std::queue<sAgentInterface>*> c = std::async(handle_client_request, sock);
        } break;
      }
      sock = std::shared_ptr<Socket>(nullptr);
    }

    /* clean finished client threads */
    for (auto id_it = finished_threads.begin(); id_it != finished_threads.end();)
    {
      for (auto th_it = client_threads.begin(); th_it != client_threads.end();)
      {
        if (*id_it == th_it->get_id())
        {
          VLOG(1) << "Erasing finished client thread " << *id_it;
          th_it->join();
          th_it = client_threads.erase(th_it);
          id_it = finished_threads.erase(id_it);
          break;
        }
        else
        {
          ++th_it;
        }
      }
    }

    if (VLOG_IS_ON(3))
    {
      mutex_agent_interface.lock();
      VLOG(3) << "Global agent count: " << agent_interface.size();
      mutex_agent_interface.unlock();
    }
  }

  VLOG(2) << "Server main loop ended.";
}


void AgentServer::client_threads_func(std::shared_ptr<Socket> client)
{
  VLOG(2) << "Server acepted connection from " << *client;

  struct sAgentInterface agent_interface_tmp;
  const int fd = client->fd();
  ssize_t tmp;
  unsigned int ptr = 0;

  while (1)
  {
    // TODO: Toto len zisti ci nastala chyba pri zistovani chyby ??
    int error = 0;
    socklen_t error_len = sizeof(error);
    if (getsockopt(fd, SOL_SOCKET, SO_ERROR, &error, &error_len) < 0)
    {
      PLOG(ERROR) << "getsockopt";
      break;
    }

    tmp = read(fd, (char*)(&agent_interface_tmp), sizeof(struct sAgentInterface));
    if (tmp < 0)
    {
      PLOG(ERROR) << "read";
      break;
    }
    if (tmp == 0)
    {
      break;
    }

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
      {
        agent_interface[idx] = agent_interface_tmp;
      }
    }

    do
    {
      agent_interface_tmp = agent_interface[ptr];
      ptr = (ptr + 1)%agent_interface.size();
    }
      while (agent_interface_tmp.id == 0);


    mutex_agent_interface.unlock();

    tmp = write(fd, (char*)(&agent_interface_tmp), sizeof(struct sAgentInterface));
    if (tmp < 0)
    {
      PLOG(ERROR) << "write";
      break;
    }
    if (tmp < (ssize_t)sizeof(struct sAgentInterface))
    {
      PLOG(ERROR) << "write written less than it should";
    }
  }

  VLOG(2) << "Server closed connection with " << *client;
  finished_threads.emplace_back(std::this_thread::get_id());
}
