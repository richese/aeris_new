#ifndef _KODAMA_H_
#define _KODAMA_H_

#include <stdint.h>

#include <gpio.h>
#include <error.h>
#include <terminal.h>

#include <timer.h>
#include <sensors.h>
#include <motor.h>

#include <config.h>

#include "system/rt_timer.h"


#include <controll/vector.h>
#include <controll/math_vector.h>
#include <controll/math.h>
#include <controll/pid.h>

#include <controll/associative_memory.h>
#include <controll/reinforcement_learning.h>
#include <controll/line_position.h>

#ifndef NULL
#define NULL  0
#endif

class CKodama: public CGPIO, public CError, public CTerminal, public CSensors, public CMotor
{
  private:
    int32_t ms_dt;
    uint32_t motor_value[MOTORS_COUNT];

  public:
    CKodama();
    ~CKodama();

    int32_t init();
    int32_t init_();

    void sleep();
    void wakeup();

    void set_dt(int32_t ms_dt_);


    int32_t sensor_get(uint32_t sensor_id);


    void sensor_read();

    int32_t comm_send( unsigned char *tx_buffer, uint32_t tx_buffer_length,
                               unsigned char *rx_buffer, uint32_t rx_buffer_length);


   void rotate_robot(int32_t angle, int32_t speed, int32_t (*terminating_func)() = NULL);
   void go_forward(int32_t distance, int32_t speed, int32_t (*terminating_func)() = NULL);

};

extern class CKodama kodama;

#endif
