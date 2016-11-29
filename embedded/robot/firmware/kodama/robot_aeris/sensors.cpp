#include "sensors.h"
#include <device.h>


CSensors::CSensors()
{

}

CSensors::~CSensors()
{

}

int32_t CSensors::sensors_init()
{
  int32_t init_res = 0;

  i2c.init();


  init_res = rgb_init();
  if (init_res != 0)
    return init_res - 1000;


  init_res = imu_init();
  if (init_res != 0)
    return init_res - 2000;

  return init_res;
}
