#ifndef _DEMO_APP_H_
#define _DEMO_APP_H_

#include <kodama.h>

#define DEMO_HELLO_WORLD                  1
#define DEMO_WIFI_CLIENT                  2
#define DEMO_BASIC_LINE_FOLLOWER          3
#define DEMO_LEARNING_LINE_FOLLOWER       4



class CDemo
{
  private:
    CRTTimer rt_timer;

  public:
    CDemo();
    ~CDemo();

    void init();
    void run(unsigned int demo_id);

  private:
    static void blink_task();
    static void wifi_client_task();
    static void moves_task();
    static void basic_line_follower_task();
    static void learning_line_follower_task();
};

extern class CDemo demo;

#endif
