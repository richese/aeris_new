#ifndef _SERVER_H_
#define _SERVER_H_


#include "agents/agent_interface.h"

#include <thread>
#include <mutex>
#include <sys/select.h>

#include "agent_group.h"

class CServer: public CAgentGroup
{
  public:
    static const int USE_AF_INET = 0x01;
    static const int USE_AF_UNIX = 0x02;
  /*
  private:
    std::vector<struct sAgentInterface> agent_interface;
    */
  private:

    std::thread *server_thread;
    std::vector<std::thread*> client_thread;

    int inet_sockfd, unix_sockfd;
    fd_set open_sockets;

  public:
    CServer();
    ~CServer();

    int listen(const int addres_family);

  private:
    void server_thread_func();
    void client_thread_func(int client_fd);
    void killer_thread_func();

    int open_unix_domain_socket();
    int open_inet_socket();
};

#endif
