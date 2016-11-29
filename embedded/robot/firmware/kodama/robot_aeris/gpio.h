#ifndef _GPIO_H_
#define _GPIO_H_

#include <stdint.h>

#define LED_0		(1<<15)    //main led, PB15
#define LED_1		(1<<3)    //white led for sensors ilumination, PA3
#define KEY 		(1<<9)    //main button, PB9

#define ENCODER_CONSTANT ((uint32_t)750) //670


class CGPIO
{
  public:
    CGPIO();
    ~CGPIO();

    int32_t gpio_init();

    void gpio_on(uint32_t pin);
    void gpio_off(uint32_t pin);
    uint32_t gpio_in(uint32_t pin);

    int32_t get_left_encoder();
    int32_t get_right_encoder();
    int32_t get_encoder_distance();
};


#endif
