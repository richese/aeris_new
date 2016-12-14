#include "wifi.h"
#include "wifi_config.h"
#include "wifi_packet.h"


#define STATE_NO_CONNECTED	((unsigned int)0)
#define STATE_CONNECTED			((unsigned int)1)


CWifi::CWifi()
{


}

CWifi::~CWifi()
{


}

//init wifi module and return WIFI_SUCCESS or WIFI+ERROR
int CWifi::init(unsigned char mode_)
{
  mode = mode_;
  i_led.i_led_set(I_LED_MODE_BLINKING, 100);
  int result = esp8266_init();
  if (result == WIFI_SUCCESS)
    i_led.i_led_set(I_LED_MODE_BLINKING, 300);
  else
    i_led.i_led_set(I_LED_MODE_PULSES_BLINKING, 8);
  return result;
}

//connect to server with specified IP, send tx_buffer with tx_buffer_length;
//and receive data from server into rx_buffer with maximum length rx_buffer_length
int CWifi::connect(char *ip, unsigned int port, char *tx_buffer, unsigned int tx_buffer_length, char *rx_buffer, unsigned int rx_buffer_length)
{
  unsigned int i;
  for (i = 0; i < rx_buffer_length; i++)
    rx_buffer[i] = 0x00;

  if (esp8266_state != STATE_CONNECTED)
	{
		esp8266_send(const_cast<char*>("AT+CIPCLOSE\r\n"));
		timer.delay_ms(100);

		esp8266_send(const_cast<char*>("AT+CIPSTART=\"TCP\",\""));
		esp8266_send(const_cast<char*>(ip));
		esp8266_send(const_cast<char*>("\","));
		esp8266_send_uint(port);
		esp8266_send(const_cast<char*>("\r\n"));

		if (esp8266_find_stream(const_cast<char*>("CONNECT"), 7, 1500) == 0)
		{
			esp8266_state = STATE_NO_CONNECTED;
			return WIFI_SERVER_CONNECTING_ERROR;
		}

		esp8266_state = STATE_CONNECTED;
	}


	esp8266_send(const_cast<char*>("AT+CIPSEND="));
	esp8266_send_uint(tx_buffer_length);
	esp8266_send(const_cast<char*>("\r\n"));

	if (esp8266_find_stream(const_cast<char*>(">"), 1, 1000) == 0)
	{
		esp8266_send(const_cast<char*>("AT+CIPCLOSE\r\n"));
		timer.delay_ms(100);
		esp8266_state = STATE_NO_CONNECTED;
		return WIFI_SERVER_CONNECTING_ERROR2;
	}

	for (i = 0; i < tx_buffer_length; i++)
		kodama.putchar(tx_buffer[i]);

	if (esp8266_find_stream(const_cast<char*>("SEND OK"), 7, 1000) == 0)
	{
		esp8266_send(const_cast<char*>("AT+CIPCLOSE\r\n"));
		timer.delay_ms(100);
		esp8266_state = STATE_NO_CONNECTED;
		return WIFI_SERVER_SENDING_ERROR;
	}

	if (esp8266_find_stream(const_cast<char*>("+IPD,"), 5, 1000) == 0)
	{
		esp8266_send(const_cast<char*>("AT+CIPCLOSE\r\n"));
		timer.delay_ms(100);
		esp8266_state = STATE_NO_CONNECTED;
		return WIFI_SERVER_RESPONSE_ERROR;
	}

	unsigned int count = 0;
	char c = 0;
	while ((c = kodama.getchar()) != ':')
		count = 10*count + (c - '0');

	esp8266_get_nonblocking(rx_buffer, rx_buffer_length, 20);


	return (count);
}

int CWifi::connect_send_data(unsigned int packet_type, unsigned char *data, unsigned int packet_size)
{
  struct sWifiPacket tmp_packet;


  tmp_packet.address = kodama.get_unique_id();
  tmp_packet.magic = WIFI_PACKET_MAGIC;
  tmp_packet.packet_type = packet_type;

  unsigned int i;

  for (i = 0; i < packet_size; i++)
    tmp_packet.data[i] = data[i];

  connect(const_cast<char*>(WIFI_SERVER_IP), WIFI_SERVER_PORT,
          (char*)(&tmp_packet), sizeof(tmp_packet),
          NULL, 0);
  return 0;
}

void CWifi::client_demo()
{
	while (1)
	{
    struct sWifiData_State state;

    state.uptime = timer.get_time()/1000;
    state.state = 0xCAFECAFE;
    state.action = 314159;

    kodama.gpio_on(LED_0);
    connect_send_data(WIFI_PACKET_TYPE_STATE, (unsigned char*)&state, sizeof(struct sWifiData_State));
    connect_send_data(WIFI_PACKET_TYPE_STATE, (unsigned char*)&state, sizeof(struct sWifiData_State));
    kodama.gpio_off(LED_0);

		timer.delay_ms(100);
	}
}

//start web server main loop
int CWifi::web_server_loop(char *page_ptr, unsigned int page_size)
{
  (void)page_ptr;
  (void)page_size;
  return -1;
}







//****************************************************
//private


//send string
void CWifi::esp8266_send(char *buf)
{
	unsigned int ptr = 0;
	while (buf[ptr] != '\0')
	{
		kodama.putchar(buf[ptr]);
		ptr++;
	}
}

//send unsigned int
void CWifi::esp8266_send_uint(unsigned int n)
{
	char s[12];
	unsigned int ptr;

	s[11] = '\0';
	ptr = 10;

	do
	{
		s[ptr] = '0' + (n%10);
		n/= 10;
		ptr--;
	}
	while (n != 0);

	ptr++;
	esp8266_send(s + ptr);
}

unsigned int CWifi::esp8266_find_stream(char *pattern_buf, unsigned int pattern_buf_size, unsigned int time_out)
{
	unsigned int i = 0;

	unsigned long int time_ =  timer.get_time();
	unsigned long int time_stop = time_ + time_out;

	kodama.clear_buffer();
	do
	{
		int c = kodama.ischar();
		if (c != NO_CHAR)
		{
			if (c == pattern_buf[i])
			{
				if (i < (pattern_buf_size-1))
					i++;
				else
				{
					kodama.clear_buffer();
					return 1;
				}
			}
			else
				i = 0;
		}

		time_ = timer.get_time();
	}
	while (time_ < time_stop);

	kodama.clear_buffer();
	return 0;
}



int CWifi::esp8266_init()
{
	esp8266_state = STATE_NO_CONNECTED;


	timer.delay_ms(3000);

	if (mode == WIFI_MODE_SERVER)
		esp8266_send(const_cast<char*>("AT+CIPMUX=1\r\n"));
	else
		esp8266_send(const_cast<char*>("AT+CIPMUX=0\r\n"));
	timer.delay_ms(1000);

	esp8266_send(const_cast<char*>("AT+CWMODE=1\r\n"));
	timer.delay_ms(1000);

	esp8266_send(const_cast<char*>("AT+CWJAP=\""));
	esp8266_send(const_cast<char*>(WIFI_SSID));
	esp8266_send(const_cast<char*>("\",\""));
	esp8266_send(const_cast<char*>(WIFI_PASS));
	esp8266_send(const_cast<char*>("\"\r\n"));

	if (esp8266_find_stream(const_cast<char*>("OK"), 2, 20000) == 0)
	{
		return WIFI_CONNECTING_ERROR;
	}

	if (mode == WIFI_MODE_SERVER)
	{
		esp8266_send(const_cast<char*>("AT+CIPSERVER=1,80\r\n"));
		timer.delay_ms(200);
	}

	return WIFI_SUCCESS;
}



int CWifi::esp8266_get_nonblocking(char *buf, unsigned int buf_length, unsigned int time_out)
{
	unsigned int ptr = 0;

	unsigned int i;
	for (i = 0; i < buf_length; i++)
		buf[i] = '\0';

	unsigned long int time_ = timer.get_time();
	unsigned long int time_stop = time_ + time_out;

  if (buf == NULL)
  {
    timer.delay_ms(time_out);
    kodama.clear_buffer();
    return 0;
  }

	do
  	{
  		int c = kodama.ischar();
  		if (c != NO_CHAR)
  		{
   	   buf[ptr] = c;
  			ptr++;
  		}

  		time_ = timer.get_time();
  	}
  	while ((ptr < buf_length) && (time_stop > time_));

	if (time_ > time_stop)
		return -1; // time out

	if (ptr >= buf_length)
		return -2; // buffer overflow

	return ptr; // OK
}
