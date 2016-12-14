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

  i_led.i_led_init();
  i_led.i_led_set(I_LED_MODE_BLINKING, 600);


  while (1)
  {
    if (kodama.gpio_in(KEY) != 0)
    {
      kodama.wakeup();

      demo.init();

      //demo.run(DEMO_HELLO_WORLD);
      demo.run(DEMO_WIFI_CLIENT);
      //demo.run(DEMO_BASIC_LINE_FOLLOWER);
      //demo.run(DEMO_LEARNING_LINE_FOLLOWER);
    }

    kodama.gpio_on(LED_0);
    timer.delay_ms(10);

    kodama.gpio_off(LED_0);
    timer.delay_ms(300);

    kodama.printf("idle %u\n", timer.get_time());
  }
}
