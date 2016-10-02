#ifndef _CLIENT_H_
#define _CLIENT_H_


class CClient
{
  public:
    CClient(char *server_ip, int port);
    ~CClient();

    void process(char *tx_buffer, unsigned int tx_buffer_size, char *rx_buffer, unsigned int rx_buffer_size);
};


#endif
