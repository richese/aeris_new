#ifndef _AGENT_SERVER_H_
#define _AGENT_SERVER_H_

#include <map>
#include <memory>
#include <mutex>
#include <thread>

#include <sys/select.h>

#include "../common/agent_group.h"
#include "../common/socket.h"


class AgentGroup
{
  private:

    std::mutex update_lock;
    std::map<sAgentInterface> data;

    std::mutex read_copy_change;
    std::shared_ptr<std::vector<sAgentInterface>> read_copy;

  public:

    std::shared_ptr<const std::vector<sAgentInterface>> read();
    void update(std::shared_ptr<const std::vector<sAgentInterface>> data);
}


class AgentServer: public CAgentGroup
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
    AgentServer();
    ~AgentServer();

    int listen(const int addres_family);

  private:
    void server_thread_func();
    void client_threads_func(std::shared_ptr<Socket> client);
    void killer_thread_func();
};


#endif /* _AGENT_SERVER_H_ */
