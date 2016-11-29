#include "demo.h"
#include <kodama.h>

#include "learning_line_follower.h"


class CDemo demo;


CDemo::CDemo()
{

}

CDemo::~CDemo()
{

}

void CDemo::init()
{

}

void CDemo::run(unsigned int demo_id)
{
  switch (demo_id)
  {
    case DEMO_HELLO_WORLD:
                          moves_task();
                          blink_task();
                          break;

    case DEMO_BASIC_LINE_FOLLOWER:
                          basic_line_follower_task();
                          break;

    case DEMO_LEARNING_LINE_FOLLOWER:
                          learning_line_follower.run();
                          break;
  }
}

void CDemo::blink_task()
{
  while (1)
  {
    kodama.gpio_on(LED_0);
    kodama.printf("system time %u [ms]\n", timer.get_time());

    timer.delay_ms(10);
    kodama.gpio_off(LED_0);
  }
}


void CDemo::moves_task()
{
  kodama.rotate_robot( 900, SPEED_MAX/2, NULL);
  kodama.rotate_robot( 900, SPEED_MAX/2, NULL);
  kodama.rotate_robot( 900, SPEED_MAX/2, NULL);
  kodama.rotate_robot( 900, SPEED_MAX/2, NULL);


  kodama.rotate_robot(-900, SPEED_MAX/2, NULL);
  kodama.rotate_robot(-900, SPEED_MAX/2, NULL);
  kodama.rotate_robot(-900, SPEED_MAX/2, NULL);
  kodama.rotate_robot(-900, SPEED_MAX/2, NULL);
}



void CDemo::basic_line_follower_task()
{
  CLinePosition line_position;
  class CPID pid(10.0, 0.0, 8.0, SPEED_MAX);

  timer.event_timer_set_period(0, 10);

  while (1)
  {
    if (timer.event_timer_check(0) == 0)
      continue;

    kodama.rgb_read();
    line_position.process(kodama.get_rgb_result());

    kodama.printf("%i %i \n", line_position.on_line(), (int)(1000*line_position.get_line_position()));

    if (line_position.on_line() != 0)
    {
      int32_t speed = SPEED_MAX/4;
      int32_t dif_speed = (int32_t)pid.process(0.0 - line_position.get_line_position());

      kodama.set_motor(MOTOR_LEFT, dif_speed + speed);
      kodama.set_motor(MOTOR_RIGHT, -dif_speed + speed);
    }
    else
    {
      kodama.set_motor(MOTOR_LEFT, -SPEED_MAX/4);
      kodama.set_motor(MOTOR_RIGHT, -SPEED_MAX/4);
      timer.delay_ms(300);

      kodama.set_motor(MOTOR_LEFT, 0);
      kodama.set_motor(MOTOR_RIGHT, 0);
      timer.delay_ms(100);
    }
  }
}
