#include "unique_id.h"

#include <stdlib.h>
#include <time.h>
#include <sstream>
#include <thread>


unsigned int get_unique_id()
{
  time_t time_id = time(0);

  std::stringstream ss;
  ss << std::this_thread::get_id();
  unsigned long int thread_id = std::stoull(ss.str());

  return (unsigned int)thread_id + time_id + rand();
}
