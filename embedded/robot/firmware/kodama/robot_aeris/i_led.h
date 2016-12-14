#ifndef _I_LED_H_
#define _I_LED_H_

#include "gpio.h"

#define I_LED_MAX_BRIGHT          ((unsigned int)63)

#define I_LED_MODE_OFF                 ((unsigned int)0)      //LED is off
#define I_LED_MODE_ON                  ((unsigned int)1)      //full bright LED on
#define I_LED_MODE_BLINKING            ((unsigned int)2)      //blinking period 1:1 perdiod in ms in param
#define I_LED_MODE_PULSES_BLINKING     ((unsigned int)3)      //blinking in grouped pulses with count in param
#define I_LED_MODE_BREATH              ((unsigned int)4)      //breathing led
#define I_LED_MODE_CUSTOM              ((unsigned int)5)      //set led bright in range <0, I_LED_MAX_BRIGHT> in param

class CILED
{
  public:
    CILED();
    ~CILED();

    void i_led_init();
    void i_led_set(unsigned int mode, unsigned int param = 100);
};

extern class CILED i_led;


#endif
