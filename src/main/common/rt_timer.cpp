#define _POSIX_C_SOURCE 200809L

#include <thread>

#include <sys/time.h>
#include <unistd.h>

#include "logging.h"
#include "rt_timer.h"


CRT_Timer::CRT_Timer() :
  run(false),
  rt_thread(),
  period_ms(1000.0)
{
  VLOG(9) << "CRT_Timer constructor";
}

CRT_Timer::~CRT_Timer()
{
  rt_timer_stop();
  VLOG(9) << "CRT_Timer destructor";
}

void CRT_Timer::rt_timer_set_period(float period_ms)
{
  this->period_ms = period_ms;
}

int CRT_Timer::rt_timer_start()
{
  run = true;
  
  if (!rt_thread.joinable())
  {
    rt_thread = std::thread(&CRT_Timer::rt_timer_thread_func, this);
  }
  else
  {
    LOG(ERROR) << "RT_Timer thread already running.";
  }
  
  return 0;
}

void CRT_Timer::rt_timer_stop()
{
  run = false;
  if (rt_thread.joinable())
  {
    rt_thread.join();
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
  VLOG(2) << "RT thread starting.";

  while (run)
  {  
    double time_start = rt_timer_get_ms_time();
    rt_timer_callback();
    double time_stop = rt_timer_get_ms_time();

    double time_delay = period_ms - (time_stop - time_start);
    if (time_delay < 0.0)
    {
      // LOG_EVERY_N(10, WARNING) << "RT timer drift: " << time_delay << "[ms]";
      LOG(WARNING) << "RT timer drift: " << time_delay << "[ms]";
      time_delay = 0.0;
    }

    rt_timer_delay_ms(time_delay);
  }

  VLOG(2) << "RT thread ended.";
}

void CRT_Timer::rt_timer_callback()
{
  LOG_EVERY_N(10, WARNING) << "Called default RT_Timer callback.";
  usleep(10);
}
