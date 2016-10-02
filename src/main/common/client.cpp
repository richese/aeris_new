#include "client.h"


CClient::CClient(char *server_ip, int port)
{
  (void)server_ip;
  (void)port;
}

CClient::~CClient()
{


}

void CClient::process(char *tx_buffer, unsigned int tx_buffer_size, char *rx_buffer, unsigned int rx_buffer_size)
{
  (void)tx_buffer;
  (void)tx_buffer_size;
  (void)rx_buffer;
  (void)rx_buffer_size;
}
