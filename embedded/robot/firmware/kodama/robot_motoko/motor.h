#ifndef _MOTORS_H_
#define _MOTORS_H_

#include <stdint.h>

#define SPEED_MAX	    ((int32_t)100)


#define MOTOR_LEFT    0
#define MOTOR_RIGHT   1

#define MOTORS_COUNT  2

class CMotor
{
  private:
    int32_t motors[MOTORS_COUNT];

  public:
    CMotor();
    ~CMotor();

    int32_t motor_init();

    void set_motor(uint32_t  motor_id, int32_t value);

    void motor_sleep();

  private:
    void motor_refresh();
    void pwm_set(uint32_t ch1, uint32_t ch2);
};

#endif
