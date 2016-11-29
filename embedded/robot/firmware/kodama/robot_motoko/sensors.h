#ifndef _SENSORS_H_
#define _SENSORS_H_


#include "i2c.h"
#include "rgb.h"
#include "imu.h"



class CSensors: public CRGB, public CIMU
{
  public:
    CSensors();
    ~CSensors();

    int32_t sensors_init();
};

#endif
