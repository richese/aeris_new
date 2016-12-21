#include <list>
#include <memory>
#include <mutex>
#include <vector>
#include <thread>

#include "agent_server.h"
#include "config.h"
#include "logging.h"
#include "signals.h"
#include "socket.h"
#include "timing.h"


ae::Server::Server() :
  m_session_id(0), // TODO
  m_agent_group_counter(0),
  m_global_state(),
  m_read_buffer(nullptr),
  m_lock_global_state(),
  m_lock_read_buffer(),
  m_sockets()
{

}


ae::Server::~Server()
{

}


int ae::Server::main()
{
  if (listen() != 0)
  {
    return -1;
  }

  std::vector<std::future> handlers;

  while (!signal::exit())
  {
    std::shared_ptr<Socket> socket = m_sockets.select(1000);
    if (!socket)
    {
      continue;
    }

    switch (socket->type())
    {
      case TYPE_SERVER:
        std::shared_ptr<Socket> new_client = socket.accept();
        VLOG(3) << "Accepted connection from " << *new_client;
        m_sockets.add_socket(new_client);
        break;

      case TYPE_ACCEPT:
        m_sockets.del_socket(socket->fd());
        handlers.push_back(std::async(&Server::request_handler, this, socket));
        break;

      default:
        break;
    }

    for (auto &handler : handlers)
    {
      if (handler.wait_for(time::milliseconds(0)) != std::future_status::timeout)
      {

      }
    }

    //join all handlers
  }

  return 0;
}
