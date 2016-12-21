#include <cstdint>
#include <chrono>
#include <thread>

#include "timing.h"


ae::time::agent_time_t ae::time::timestamp()
{
  using std::chrono::duration_cast;
  auto now = clock::now();
  auto since_epoch = duration_cast<agent_duration_t>(now.time_since_epoch());
  return since_epoch.count();
}

void ae::time::sleep_until(clock::time_point point)
{
  std::this_thread::sleep_until(point);
}
