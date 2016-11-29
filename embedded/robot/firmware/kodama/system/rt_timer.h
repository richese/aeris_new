#ifndef _RT_TIMER_H_
#define _RT_TIMER_H_

#include <stdint.h>
#define RT_TIMER_TASK_MAX_COUNT      ((unsigned int)8)


typedef void (*TimerTaskFunction)();


struct sTimerTask
{
  TimerTaskFunction func;
  unsigned int ms_interval;
  uint64_t next_run_time;
  unsigned char repeat;
};


class CRTTimer
{
  private:
    struct sTimerTask timer_tasks[RT_TIMER_TASK_MAX_COUNT];

  public:
    CRTTimer();
    ~CRTTimer();

    void init();


    int add_task(TimerTaskFunction func, unsigned int ms_interval, unsigned char repeat);

    void main();
};


#endif
