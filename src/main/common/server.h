#ifndef _SERVER_H_
#define _SERVER_H_


#include "agents/agent_interface.h"

#include <thread>
#include <mutex>

class CServer
{
  private:

    std::vector<struct sAgentInterface> agent_interface;

  private:
    bool run;
    std::mutex mutex_agent_interface;

    std::thread *server_thread, *killer_thread;
    std::vector<std::thread*> client_thread;

    int sockfd, client_fd;

  public:
    CServer();
    ~CServer();

  private:
    void server_thread_func();
    void client_thread_func(int client_fd);
    void killer_thread_func();

};

#endif
