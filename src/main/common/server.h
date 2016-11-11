#ifndef _SERVER_H_
#define _SERVER_H_

#include <memory>
#include <mutex>
#include <thread>

#include <sys/select.h>

#include "agent_group.h"
#include "socket.h"


class CServer: public CAgentGroup
{
  public:
    static const int USE_AF_INET = 0x01;
    static const int USE_AF_UNIX = 0x02;

  private:

    std::shared_ptr<std::thread> server_thread;
    std::vector<std::thread> client_threads;
    std::vector<std::thread::id> finished_threads;

    SocketWatch sockets;

  public:
    CServer();
    ~CServer();

    int listen(const int addres_family);

  private:
    void server_thread_func();
    void client_threads_func(std::shared_ptr<Socket> client);
    void killer_thread_func();
};

#endif
