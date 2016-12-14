#include "gpio.h"

#include <device.h>

volatile uint32_t g_left_encoder, g_right_encoder;

CGPIO::CGPIO()
{
  gpio_init();
}

CGPIO::~CGPIO()
{

}

int32_t CGPIO::gpio_init()
{
  GPIO_InitTypeDef  GPIO_InitStructure;

  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOC, ENABLE);


  GPIO_InitStructure.GPIO_Pin = LED_0;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(GPIOB, &GPIO_InitStructure);


  GPIO_InitStructure.GPIO_Pin = LED_1;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(GPIOA, &GPIO_InitStructure);


  GPIO_InitStructure.GPIO_Pin = KEY;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(GPIOB, &GPIO_InitStructure);

  gpio_on(LED_1);

  g_left_encoder = 0;
  g_right_encoder = 0;

  return 0;
}





void CGPIO::gpio_on(uint32_t pin)
{
  switch (pin)
  {
    case LED_0: GPIOB->BSRR = LED_0; break;
    case LED_1: GPIOA->BRR = LED_1; break;
  }
}

void CGPIO::gpio_off(uint32_t pin)
{
  switch (pin)
  {
    case LED_0: GPIOB->BRR = LED_0; break;
    case LED_1: GPIOA->BSRR = LED_1; break;
  }
}

uint32_t CGPIO::gpio_in(uint32_t pin)
{
  return (~GPIOB->IDR)&pin;
}





int32_t CGPIO::get_left_encoder()
{
  g_left_encoder++;

  __disable_irq();
  volatile int32_t tmp = g_left_encoder;
  __enable_irq();

  return (tmp*ENCODER_CONSTANT)/((int32_t)1000);
}


int32_t CGPIO::get_right_encoder()
{
  g_right_encoder++;

  __disable_irq();
  volatile int32_t tmp = g_right_encoder;
  __enable_irq();

  return (tmp*ENCODER_CONSTANT)/((int32_t)1000);
}


int32_t CGPIO::get_encoder_distance()
{
	return (get_left_encoder() + get_right_encoder())/((int32_t)2);
}





#define PWM_BASE_CLOCK  SystemCoreClock
#define PWM_FREQUENCY   ((unsigned int)200)
#define PWM_PERIOD      ((SystemCoreClock/PWM_FREQUENCY) - 1)

void CGPIO::led_blinking_init()
{
  GPIO_InitTypeDef  GPIO_InitStructure;

  GPIO_InitStructure.GPIO_Pin = LED_0;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

  GPIO_Init(GPIOB, &GPIO_InitStructure);
  GPIO_PinAFConfig(GPIOB, GPIO_PinSource15, GPIO_AF_1);    //connect PB15 to timer15


  RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM15, ENABLE);
  TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;

  TIM_TimeBaseStructure.TIM_Prescaler = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
  TIM_TimeBaseStructure.TIM_Period = PWM_PERIOD;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_RepetitionCounter = 0;

  TIM_TimeBaseInit(TIM15, &TIM_TimeBaseStructure);


  led_blinking_set_pwm(0);

  TIM_Cmd(TIM15, ENABLE);
  TIM_CtrlPWMOutputs(TIM15, ENABLE);
}

void CGPIO::led_blinking_set_pwm(unsigned int pwm)
{
  TIM_OCInitTypeDef  TIM_OCInitStructure;

  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
  TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Enable;
  TIM_OCInitStructure.TIM_Pulse = 0;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
  TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_High;
  TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Set;
  TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Reset;


  TIM_OCInitStructure.TIM_Pulse = ((63 - pwm)*(PWM_PERIOD-1))/64;
  TIM_OC2Init(TIM15, &TIM_OCInitStructure);
}

void CGPIO::led_blinking(unsigned int mode)
{

}







#ifdef __cplusplus
extern "C" {
#endif

void EXTI9_5_IRQHandler(void)
{
	g_left_encoder++;
	EXTI_ClearITPendingBit(EXTI_Line6);

}

void EXTI15_10_IRQHandler()
{
	g_right_encoder++;
	EXTI_ClearITPendingBit(EXTI_Line12);
}

#ifdef __cplusplus
}
#endif
