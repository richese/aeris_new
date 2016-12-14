#ifndef _WIFI_PACKET_H_
#define _WIFI_PACKET_H_


#define WIFI_PACKET_MAGIC           ((unsigned int)0xCAFE2357)
#define WIFI_PACKET_DATA_SIZE       ((unsigned int)64)

#define WIFI_PACKET_TYPE_STATE      ((unsigned int)0)     //this packet is sending basic robot state information
#define WIFI_PACKET_TYPE_STRING       ((unsigned int)1)
#define WIFI_PACKET_TYPE_CONFIG     ((unsigned int)2)
#define WIFI_PACKET_TYPE_BOOT_INFO       ((unsigned int)3)
#define WIFI_PACKET_TYPE_BOOT_DATA       ((unsigned int)4)

struct sWifiPacket
{
  unsigned int address;
  unsigned int magic;
  unsigned int packet_type;
  unsigned char data[WIFI_PACKET_DATA_SIZE];
} __attribute__((packed, aligned(1)));


struct sWifiData_State
{
  unsigned int uptime;
  unsigned int state;
  unsigned int action;
} __attribute__((packed, aligned(1)));


struct sWifiData_String
{
  char string[WIFI_PACKET_DATA_SIZE];
} __attribute__((packed, aligned(1)));


#endif
