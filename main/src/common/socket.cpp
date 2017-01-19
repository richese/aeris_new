#include <cstdlib>
#include <cstring>
#include <mutex>
#include <memory>

#include <arpa/inet.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <unistd.h>

#include "logging.h"
#include "socket.h"


/** \brief Create new AF_INET socket.
 *
 * \param ip
 *   An IPv4 address in number-and-dots notation or hostname (such as localhost).
 *   Length of this string  is limited to 108 characters.
 * \param portno
     For server socket it is the port it will listen on.
     For client connection it is port that remote server is listening on.
 */
ae::Socket::Socket(const char *ip, const int portno) :
  m_fd(-1),
  m_family(AF_INET),
  m_portno(portno),
  m_address(),
  m_type(TYPE_NONE)
{
  if (ip != nullptr)
  {
    strncpy(m_address, ip, sizeof(m_address));
  }
  else
  {
    LOG(ERROR) << "Trying to create inet socket without ip address.";
    m_address[0] = '\0';
  }
}

/** \brief Create new AF_UNIX socket.
 *
 * \param path
 *   Absolute path to local unix socket.
 *   Length of this string  is limited to 108 characters.
 */
ae::Socket::Socket(const char *path) :
  m_fd(-1),
  m_family(AF_UNIX),
  m_portno(0),
  m_address(),
  m_type(TYPE_NONE)
{
  if (path != nullptr)
  {
    LOG_IF(strlen(path) >= 108, ERROR) << "Socket path \'" << path << "\' is longer than 108 characters.";
    strncpy(m_address, path, sizeof(m_address));
  }
  else
  {
    LOG(ERROR) << "Trying to create unix socket without path.";
    m_address[0] = '\0';
  }
}

/** \brief Private constructor for accepted connections. */
ae::Socket::Socket(int fd, int family, const char *address, int portno) :
  m_fd(fd),
  m_family(family),
  m_portno(portno),
  m_type(TYPE_ACCEPT)
{
  if (address != nullptr)
  {
    strncpy(m_address, address, sizeof(m_address));
  }
}

ae::Socket::~Socket()
{
  close();
}

/** \brief Turn socket into server socket that will listen for incomming connections.
 *
 * \param queue_len
 *   Maximal number of waiting connections before system starts dropping them.
 * \returns
 *   0 on success.
 *  -1 on failure.
 */
int ae::Socket::listen(int queue_len)
{
  if (m_fd != -1)
  {
    LOG(ERROR) << *this <<" is already open.";
    return -1;
  }

  if (queue_len < 0)
  {
    queue_len = 1;
    LOG(WARNING) << "Negative queue len given for " << *this;
  }

  if ((m_fd = ::socket(m_family, SOCK_STREAM, 0)) < 0)
  {
    PLOG(ERROR) << "Error opening " << *this;
    ::close(m_fd);
    m_fd = -1;
    return -1;
  }

  if (m_family == AF_UNIX)
  {
    struct sockaddr_un addr;
    memset(&addr, 0, sizeof(addr));
    addr.sun_family = AF_UNIX;
    strcpy(addr.sun_path, m_address);
    int addr_len = strlen(addr.sun_path) + sizeof(addr.sun_family);

    if (::unlink(addr.sun_path) < 0 && errno != ENOENT)
    {
      PLOG(ERROR) << "Unlinking old unix socket path failed for " << *this;
      ::close(m_fd);
      m_fd = -1;
      return -1;
    }

    if (::bind(m_fd, (struct sockaddr *) &addr, addr_len))
    {
      PLOG(ERROR) << "Binding " << *this << " failed";
      ::close(m_fd);
      m_fd = -1;
      return -1;
    }

    if (::listen(m_fd, queue_len) < 0)
    {
      PLOG(ERROR) << "Unable to listen on " << *this;
      ::close(m_fd);
      m_fd = -1;
      return -1;
    }
  }
  else
  {
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = INADDR_ANY;
    addr.sin_port = htons(m_portno);

    if (::bind(m_fd, (struct sockaddr *) &addr, sizeof(addr)))
    {
      PLOG(ERROR) << "Binding socket " << *this << " failed";
      ::close(m_fd);
      m_fd = -1;
      return -1;
    }

    if (::listen(m_fd, 5) < 0)
    {
      PLOG(ERROR) << "Unable to listen on " << *this;
      ::close(m_fd);
      m_fd = -1;
      return -1;
    }
  }

  m_type = TYPE_SERVER;
  VLOG(1) << "Opened " << *this;

  return 0;
}

/** \brief Wait for and accept incomming connection on listening server socket.
 *
 * This call is blocking until there is an incomming connection.
 *
 * \returns
 *   Shared pointer to new client socket object on success.
 *   Shared pointer to nullptr on failure.
 */
std::shared_ptr<ae::Socket> ae::Socket::accept()
{
  Socket *sock = nullptr;

  if (m_fd == -1)
  {
    LOG(ERROR) << "Trying to accept on unopened socket " << *this;
    return std::shared_ptr<Socket>(nullptr);
  }

  if (m_type != TYPE_SERVER)
  {
    LOG(ERROR) << "Trying to accept connection on non-server socket " << *this;
    return std::shared_ptr<Socket>(nullptr);
  }

  if (m_family == AF_UNIX)
  {
    int client_fd;
    struct sockaddr_un client_addr;
    socklen_t client_addr_len = sizeof(client_addr);

    if ((client_fd = ::accept(m_fd, (struct sockaddr *) &client_addr, &client_addr_len)) < 0)
    {
      PLOG(ERROR) << "Accept error on " << *this;
      return std::shared_ptr<Socket>(nullptr);
    }

    sock = new Socket(client_fd, AF_UNIX, m_address, 0);
  }
  else
  {
    int client_fd;
    struct sockaddr_in client_addr;
    socklen_t client_addr_len = sizeof(client_addr);

    if ((client_fd = ::accept(m_fd, (struct sockaddr *) &client_addr, &client_addr_len)) < 0)
    {
      PLOG(ERROR) << "Accept error on " << *this;
      return std::shared_ptr<Socket>(nullptr);
    }

    sock = new Socket(client_fd, AF_INET, inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));
  }

  VLOG_IF(sock != nullptr, 1) << "Accepted connection from " << *sock;
  return std::shared_ptr<Socket>(sock);
}

/** \brief Turn socket into client socket that will create new connection to server.
 *
 * \returns
 *   0 on success.
 *  -1 on failure.
 */
int ae::Socket::connect()
{
  if (m_fd != -1)
  {
    LOG(ERROR) << *this << "is already connected.";
    return -1;
  }

  if ((m_fd = socket(m_family, SOCK_STREAM, 0)) < 0)
  {
    PLOG(ERROR) << "Unable to open " << *this;
    ::close(m_fd);
    m_fd = -1;
    return -1;
  }

  if (m_family == AF_UNIX)
  {
    struct sockaddr_un addr;
    memset(&addr, 0, sizeof(addr));
    addr.sun_family = AF_UNIX;
    strcpy(addr.sun_path, m_address);
    int addr_len = strlen(addr.sun_path) + sizeof(addr.sun_family);

    if (::connect(m_fd, (struct sockaddr *) &addr, addr_len) < 0)
    {
      PLOG(ERROR) << "Unable to connect " << *this;
      ::close(m_fd);
      m_fd = -1;
      return -1;
    }
  }
  else
  {
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr(m_address);
    addr.sin_port = htons(m_portno);

    if (::connect(m_fd, (struct sockaddr *) &addr, sizeof(addr)) < 0)
    {
      PLOG(ERROR) << "Unable to connect " << *this;
      ::close(m_fd);
      m_fd = -1;
      return -1;
    }
  }

  m_type = TYPE_CLIENT;
  VLOG(1) << "Connected to " << *this;

  return 0;
}

/** \brief Closes connection and frees sockets file descriptor. */
void ae::Socket::close()
{
  VLOG(1) << "Closing socket " << *this;
  m_type = TYPE_NONE;
  ::close(m_fd);
  m_fd = -1;
}


ssize_t ae::Socket::send(void *buf, size_t len)
{
  if (!valid())
  {
    return -1;
  }

  char *cbuf = (char*)buf;
  ssize_t sent_total = 0;
  ssize_t retval;

  while ((size_t)sent_total != len)
  {
    retval = ::send(m_fd, cbuf + sent_total, len - sent_total, MSG_NOSIGNAL);
    if (retval > 0)
    {
      sent_total += retval;
      continue;
    }
    if (retval == 0)
    {
      return 0;
    }
    if (errno == EAGAIN || errno == EWOULDBLOCK || errno == EINTR)
    {
      continue;
    }

    PLOG(ERROR) << "Error while sending data to " << *this;
    close();
    return -1;
  }
  return sent_total;
}


ssize_t ae::Socket::recv(void *buf, size_t len)
{
  if (!valid())
  {
    return -1;
  }

  char *cbuf = (char*)buf;
  ssize_t received_total = 0;
  ssize_t retval;

  while ((size_t)received_total != len)
  {
    retval = ::recv(m_fd, cbuf + received_total, len - received_total, MSG_NOSIGNAL);
    if (retval > 0)
    {
      received_total += retval;
      continue;
    }
    if (retval == 0)
    {
      return 0;
    }
    if (errno == EAGAIN || errno == EWOULDBLOCK || errno == EINTR)
    {
      continue;
    }

    PLOG(ERROR) << "Error while receiving data through " << *this;
    close();
    return -1;
  }
  return received_total;
}


ssize_t ae::Socket::exchange(void *buf, size_t len)
{
  if (!valid())
  {
    return -1;
  }

  ssize_t retval = send(buf, len);
  if ((size_t)retval != len)
  {
    return retval;
  }

  if (!valid())
  {
    return -1;
  }

  return recv(buf, len);
}


/** \brief Logging function to allow logging with easylogging++. */
void ae::Socket::log(el::base::type::ostream_t& os) const
{
  os << "Socket(type=";
  switch (m_type)
  {
    case TYPE_SERVER: os << 'S'; break;
    case TYPE_CLIENT: os << 'C'; break;
    case TYPE_ACCEPT: os << 'A'; break;
    default: os << "N/A"; break;
  }
  os << ", fd=" << m_fd << ", family=";
  if (m_family == AF_UNIX)
  {
    os << "UNIX, path=" << m_address;
  }
  else
  {
    os << "INET, addr=" << m_address << ", port=" << m_portno;
  }
  os << ")";
}

ae::SocketWatch::SocketWatch() :
  m_access_lock(),
  m_sockets()
{
  FD_ZERO(&m_read_set);
}

ae::SocketWatch::~SocketWatch()
{

}

/** \brief Add socket to watchlist */
void ae::SocketWatch::add_socket(std::shared_ptr<Socket> sock)
{
  if (sock->valid())
  {
    m_access_lock.lock();
    m_sockets.push_back(sock);
    FD_SET(sock->fd(), &m_read_set);
    m_access_lock.unlock();
  }
  else
  {
    LOG(ERROR) << "Trying to add invalid socket to SocketWatch: " << *sock;
  }
}

/** \brief Remove socket from watchlist */
void ae::SocketWatch::del_socket(int sock_fd)
{
  m_access_lock.lock();
  for (auto sock=m_sockets.begin(); sock != m_sockets.end(); sock++)
  {
    if ((*sock)->fd() == sock_fd)
    {
      FD_CLR(sock_fd, &m_read_set);
      m_sockets.erase(sock);
      break;
    }
  }
  m_access_lock.unlock();
}

/** \brief Return socket from watchlist that is ready for read operations.
 *
 * \param timeout
 *   Wait for sockets max timeout ms.
 * \returns
 *   shared_ptr pointing to Socket that is ready to read on success.
 *   shared_ptr pointing to nullptr if no sockets are ready or on failure.
 */
std::shared_ptr<ae::Socket> ae::SocketWatch::select(int timeout)
{
  struct timeval timeout_val;
  timeout_val.tv_sec = timeout / 1000;
  timeout_val.tv_usec = (timeout - (timeout_val.tv_sec * 1000)) * 1000;

  m_access_lock.lock();
  fd_set read_set = m_read_set;
  m_access_lock.unlock();

  if (::select(FD_SETSIZE, &read_set, nullptr, nullptr, &timeout_val) < 0)
  {
    if (errno == EINTR)
    {
      PLOG(DEBUG) << "Select call was interrupted";
    }
    else
    {
      PLOG(ERROR) << "Waiting for socket activity failed";
    }
    return std::shared_ptr<Socket>(nullptr);
  }

  std::lock_guard<std::mutex> lock_until_return(m_access_lock);
  for (std::shared_ptr<Socket> &sock: m_sockets)
  {
    if (FD_ISSET(sock->fd(), &read_set))
    {
      return sock;
    }
  }
  return std::shared_ptr<Socket>(nullptr);
}
