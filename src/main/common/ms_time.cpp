#include <ms_time.h>


#define _POSIX_C_SOURCE 200809L

#include <sys/time.h>
// #include <time.h>
#include <unistd.h>
#include <debug.h>



double get_ms_time()
{
  struct timeval readed_time;

  gettimeofday(&readed_time, NULL);

  return (readed_time.tv_sec*1000.0 + readed_time.tv_usec/1000.0);
}
