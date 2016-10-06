#include "unique_id.h"

#include <stdlib.h>
#include <time.h>
#include <sstream>
#include <thread>


unsigned long int get_unique_id()
{
  unsigned long int res = 0;

  while (res == 0)
  {
    time_t time_id = time(0);

    std::stringstream ss;
    ss << std::this_thread::get_id();
    unsigned long int thread_id = std::stoull(ss.str());

    res = 1000000*(thread_id + time_id) + rand();
  }

  return res;
}
