#ifndef _WIFI_H_
#define _WIFI_H_

//TODO this module is not tested yet !!!!!!!!!!!!!!


#define WIFI_SUCCESS                   ((int)0)
#define WIFI_RESET_ERROR               ((int)-1)
#define WIFI_CONNECTING_ERROR     ((int)-2)
#define WIFI_SERVER_CONNECTING_ERROR   ((int)-3)
#define WIFI_SERVER_CONNECTING_ERROR2  ((int)-4)
#define WIFI_SERVER_SENDING_ERROR      ((int)-5)
#define WIFI_SERVER_RESPONSE_ERROR     ((int)-6)

#define WIFI_NO_CONNECTED_CLIENT             ((int)-7)
#define WIFI_SERVER_DATA_SENDING_ERROR       ((int)-8)


#define WIFI_MODE_CLIENT      ((unsigned char )0)
#define WIFI_MODE_SERVER      ((unsigned char )1)

#include "kodama.h"


class CWifi
{
  private:
    unsigned int esp8266_state;
    unsigned char mode;

  public:
    CWifi();
    ~CWifi();

    //init wifi module and return WIFI_SUCCESS or WIFI+ERROR
    int init(unsigned char mode_);

    //connect to server with specified IP, send tx_buffer with tx_buffer_length;
    //and receive data from server into rx_buffer with maximum length rx_buffer_length
    int connect(char *ip, unsigned int port, char *tx_buffer, unsigned int tx_buffer_length, char *rx_buffer, unsigned int rx_buffer_length);

    int connect_send_data(unsigned int packet_type, unsigned char *data, unsigned int packet_size);

    void client_demo();

    //start web server main loop
    int web_server_loop(char *page_ptr, unsigned int page_size);

  private:
    void esp8266_send(char *buf);
    void esp8266_send_uint(unsigned int n);
    unsigned int esp8266_find_stream(char *pattern_buf, unsigned int pattern_buf_size, unsigned int time_out);

    int esp8266_init();
    int esp8266_get_nonblocking(char *buf, unsigned int buf_length, unsigned int time_out);

};

#endif
