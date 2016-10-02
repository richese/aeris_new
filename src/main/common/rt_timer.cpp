#include "rt_timer.h"

#define _POSIX_C_SOURCE 200809L

#include <sys/time.h>
// #include <time.h>
#include <unistd.h>
#include <thread>
#include <debug.h>

CRT_Timer::CRT_Timer()
{
  run = false;
  rt_thread = NULL;
  this->period_ms = 1000.0;

  #ifdef _DEBUG_COMMON_
  printf("%lu : RT timer created\n", (unsigned long int)this);
  #endif
}

CRT_Timer::~CRT_Timer()
{
  run = false;
  if (rt_thread != NULL)
  {
    rt_thread->join();
    delete rt_thread;

    rt_thread = NULL;
  }
}

void CRT_Timer::rt_timer_set_period(float period_ms)
{
  this->period_ms = period_ms;
}

int CRT_Timer::rt_timer_start()
{
  run = true;
  rt_thread = new std::thread(&CRT_Timer::rt_timer_thread_func, this);

  if (rt_thread != NULL)
    return 0;
  return -1;
}

void CRT_Timer::rt_timer_stop()
{
  run = false;
  if (rt_thread != NULL)
  {
    rt_thread->join();
    delete rt_thread;

    rt_thread = NULL;
  }
}


double CRT_Timer::rt_timer_get_ms_time()
{
  struct timeval readed_time;

  gettimeofday(&readed_time, NULL);

  return (readed_time.tv_sec*1000.0 + readed_time.tv_usec/1000.0);
}

void CRT_Timer::rt_timer_delay_ms(float delay_time_ms)
{
  usleep(delay_time_ms*1000.0);
}

void CRT_Timer::rt_timer_thread_func()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : rt thread starting\n", (unsigned long int)this);
  #endif

  while (run)
  {
    double time_start = rt_timer_get_ms_time();
    rt_timer_callback();
    double time_stop = rt_timer_get_ms_time();

    double time_delay = period_ms - (time_stop - time_start);
    if (time_delay < 0.0)
    {
      #ifdef _DEBUG_COMMON_
      printf("%lu : RT warning %6.3f[ms]\n", (unsigned long int)this, time_delay);
      #endif
      time_delay = 0.0;
    }

    rt_timer_delay_ms(time_delay);
  }

  #ifdef _DEBUG_COMMON_
  printf("%lu : rt thread ending\n", (unsigned long int)this);
  #endif
}

void CRT_Timer::rt_timer_callback()
{
  printf("%f called callback\n", rt_timer_get_ms_time());
  usleep(10);
}
