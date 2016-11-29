#ifndef _MOTORS_H_
#define _MOTORS_H_

#include <stdint.h>

#define SPEED_MAX      (int32_t)44


#define MOTOR_LEFT    0
#define MOTOR_RIGHT   1

#define MOTORS_COUNT  2

class CMotor
{
  private:
    uint32_t motors[MOTORS_COUNT];

  public:
    CMotor();
    ~CMotor();

    int32_t motor_init();

    void motor_sleep();


    void set_motor(uint32_t  motor_id, int32_t value);

    void motor_refresh();

};

#endif
