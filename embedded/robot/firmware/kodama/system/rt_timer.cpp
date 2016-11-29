#include "rt_timer.h"
#include <timer.h>


#ifndef NULL
#define NULL  0
#endif

#define FILTER_CONST  ((unsigned int)7)

extern class CTimer timer;



CRTTimer::CRTTimer()
{
  init();
}

CRTTimer::~CRTTimer()
{

}

void CRTTimer::init()
{
  unsigned int i;
  for (i = 0; i < RT_TIMER_TASK_MAX_COUNT; i++)
  {
    timer_tasks[i].func = NULL;
    timer_tasks[i].ms_interval = 0;
    timer_tasks[i].next_run_time = 0;
  }
}

int CRTTimer::add_task(TimerTaskFunction func, unsigned int ms_interval, unsigned char repeat)
{
  unsigned int i;
  int res = -1;
  for (i = 0; i < RT_TIMER_TASK_MAX_COUNT; i++)
    if (timer_tasks[i].func == NULL)
    {
      res = i;
      break;
    }

  if (res != -1)
  {
    timer_tasks[res].func = func;
    timer_tasks[res].ms_interval = ms_interval;
    timer_tasks[res].next_run_time = 0;
    timer_tasks[res].repeat = repeat;
  }

  return res;
}

void CRTTimer::main()
{
  unsigned int i;
  for (i = 0; i < RT_TIMER_TASK_MAX_COUNT; i++)
    if (timer_tasks[i].func != NULL)
    {
      uint64_t time_now = timer.get_time();
      if (time_now >= timer_tasks[i].next_run_time)
      {
        timer_tasks[i].next_run_time = time_now + timer_tasks[i].ms_interval;
        timer_tasks[i].func();
      }

      if (timer_tasks[i].repeat == 0)
        timer_tasks[i].func = NULL;
    }
}
