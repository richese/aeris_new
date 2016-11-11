#ifndef _SOCKET_H_
#define _SOCKET_H_

#include <memory>
#include <vector>

#include <sys/select.h>

#include "logging.h"


/** \brief Encapsulates operations dealing with establishing socket connections. 
 *
 * Supports AF_INET and AF_UNIX address families 
 * and both server and client side connections.
 */
class Socket : public el::Loggable
{
  private:
    enum SocketType {
      TYPE_NONE   = 0,
      TYPE_SERVER = 1,
      TYPE_CLIENT = 2,
      TYPE_ACCEPT = 3
    };
    
    int m_fd;
    const int m_family;
    const int m_portno;
    char m_address[108];
    SocketType m_type;
    
  public:
    
    Socket(const char *ip, const int portno);
    Socket(const char *path);
    ~Socket();
    
    int fd() const { return m_fd; }
    int family() const { return m_family; }
    int portno() const { return m_portno; }
    const char * address() const { return m_address; }
    const char * path() const { return m_address; }
    SocketType type() const { return m_type; }
    
    int listen(int queue_len);
    std::shared_ptr<Socket> accept();
    int connect();
    void close();
    
    /*virtual*/ void log(el::base::type::ostream_t& os) const;
    
  private:
    
    Socket(int fd, int family, const char *address, int portno);
};

class SocketWatch
{
  private:
    std::vector<std::shared_ptr<Socket>> m_sockets;
    fd_set m_read_set;
  
  public:
    
    SocketWatch();
    ~SocketWatch();
    
    const std::vector<std::shared_ptr<Socket>>& sockets() const { return m_sockets; }
    
    void add_socket(std::shared_ptr<Socket> sock);
    void del_socket(int sock_fd);
    
    std::shared_ptr<Socket> select(int timeout);
};


#endif /* _SOCKET_H_ */