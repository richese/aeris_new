#include <device.h>
#include <kodama.h>

#include "usr/demo.h"

int main()
{
  sytem_clock_init();

  if (kodama.init() != 0)
  {
    // kodama.error_func();
  }

  kodama.set_dt(10);
  kodama.sleep();


  float number = 3.141592654;
  kodama.printf("testing number print %u %u %u:\n", sizeof(unsigned int), sizeof(float), sizeof(double));
  kodama.printf("float number %f \n",  number);

  kodama.printf("%f %f %f %f %f %f %f %f\n",  0.0, 1.0, 0.123456, 3.141592654, 32.7681, 1234.5678, 5.7, 5.72);
  kodama.printf("%f %f %f %f %f %f %f %f\n", -0.0, -1.0, -0.123456, -3.141592654, -32.7681, -1234.5678, -5.7, -5.72);

  while (1)
  {
    if (kodama.gpio_in(KEY) != 0)
    {
      kodama.wakeup();

      demo.init();

      //demo.run(DEMO_HELLO_WORLD);
      //demo.run(DEMO_BASIC_LINE_FOLLOWER);
      demo.run(DEMO_LEARNING_LINE_FOLLOWER);
    }

    kodama.gpio_on(LED_0);
    timer.delay_ms(10);

    kodama.gpio_off(LED_0);
    timer.delay_ms(300);

    kodama.printf("idle %u\n", timer.get_time());
  }
}
