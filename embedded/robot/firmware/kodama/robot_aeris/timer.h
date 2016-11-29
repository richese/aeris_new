#ifndef _TIMER_H_
#define _TIMER_H_

#include <stdint.h>

#define EVENT_TIMER_COUNT   ((unsigned int)8)

//typedef unsigned long long int time_t;
typedef unsigned int time_t;

class CTimer
{
  public:
    CTimer();
    ~CTimer();

    int32_t timer_init();

    time_t get_time();

    void delay_loops(uint32_t loops);
    void delay_ms(uint32_t time_ms);

    void event_timer_set_period(uint8_t timer_id, uint32_t period_ms);
    uint8_t event_timer_check(uint8_t timer_id);

};

extern class CTimer timer;

#endif
