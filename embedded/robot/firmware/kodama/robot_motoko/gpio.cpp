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

  GPIO_Init(GPIO_BASE, &GPIO_InitStructure);


  GPIO_InitStructure.GPIO_Pin = KEY;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(GPIO_BASE, &GPIO_InitStructure);

  /*
  g_mode_jumper = 0;

  GPIO_InitStructure.GPIO_Pin = 1<<10;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_DOWN;

  GPIO_Init(GPIOA, &GPIO_InitStructure);

  if (GPIOA->IDR&(1<<10))
    g_mode_jumper = 1;
    */




  EXTI_InitTypeDef EXTI_InitStructure;
  NVIC_InitTypeDef   NVIC_InitStructure;


  /* Configure PC6 and PC12 pin as input pullup */
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6|GPIO_Pin_12;
  GPIO_Init(GPIOC, &GPIO_InitStructure);



  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

  /* Connect EXTI Line6 to PC6 pin */
  SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOC, EXTI_PinSource6);

    /* Configure EXTI Line6 */
  EXTI_InitStructure.EXTI_Line = EXTI_Line6;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising_Falling;
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;
  EXTI_Init(&EXTI_InitStructure);

  /* Enable and set EXTI Line9-5 Interrupt to the lowest priority */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI9_5_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x0F;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x0F;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);



  /* Connect EXTI Line12 to PC12 pin */
  SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOC, EXTI_PinSource12);

    /* Configure EXTI Line12*/
  EXTI_InitStructure.EXTI_Line = EXTI_Line12;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising_Falling;
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;
  EXTI_Init(&EXTI_InitStructure);

  /* Enable and set EXTI Line15-10 Interrupt to the lowest priority */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI15_10_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x0F;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x0F;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);

  EXTI_ClearITPendingBit(EXTI_Line6);
  EXTI_ClearITPendingBit(EXTI_Line12);

  g_left_encoder = 0;
  g_right_encoder = 0;

  gpio_on(LED_0);

  return 0;
}


void CGPIO::gpio_on(uint32_t pin)
{
	GPIO_BASE->BSRR = pin;
}

void CGPIO::gpio_off(uint32_t pin)
{
  GPIO_BASE->BRR = pin;
}

uint32_t CGPIO::gpio_in(uint32_t pin)
{
  return (~GPIO_BASE->IDR)&pin;
}





int32_t CGPIO::get_left_encoder()
{
  __disable_irq();
  volatile int32_t tmp = g_left_encoder;
  __enable_irq();

  return (tmp*ENCODER_CONSTANT)/((int32_t)1000);
}


int32_t CGPIO::get_right_encoder()
{
  __disable_irq();
  volatile int32_t tmp = g_right_encoder;
  __enable_irq();

  return (tmp*ENCODER_CONSTANT)/((int32_t)1000);
}


int32_t CGPIO::get_encoder_distance()
{
	return (get_left_encoder() + get_right_encoder())/((int32_t)2);
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
