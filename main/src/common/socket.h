#ifndef _SOCKET_H_
#define _SOCKET_H_

#include <memory>
#include <mutex>
#include <vector>

#include <sys/select.h>

#include "logging.h"


namespace ae
{


/** \brief Encapsulates operations dealing with establishing socket connections.
 *
 * Supports AF_INET and AF_UNIX address families
 * and both server and client side connections.
 */
class Socket : public el::Loggable
{
  public:
    enum SocketType {
      TYPE_NONE   = 0,
      TYPE_SERVER = 1,
      TYPE_CLIENT = 2,
      TYPE_ACCEPT = 3
    };

  private:
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

    bool valid() const { return !(m_fd < 0); }

    int listen(int queue_len);
    std::shared_ptr<Socket> accept();
    int connect();
    void close();

    ssize_t send(void *buf, size_t len);
    ssize_t recv(void *buf, size_t len);
    ssize_t exchange(void *buf, size_t len);

    /*virtual*/ void log(el::base::type::ostream_t& os) const;

  private:

    Socket(int fd, int family, const char *address, int portno);
};


class SocketWatch
{
  private:
    std::mutex m_access_lock;
    std::vector<std::shared_ptr<Socket>> m_sockets;
    fd_set m_read_set;

  public:

    SocketWatch();
    ~SocketWatch();

    void add_socket(std::shared_ptr<Socket> sock);
    void del_socket(int sock_fd);

    std::shared_ptr<Socket> select(int timeout);
};


} /* namespace ae */


#endif /* _SOCKET_H_ */
