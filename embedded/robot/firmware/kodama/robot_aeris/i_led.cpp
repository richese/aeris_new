#include "i_led.h"

#include <device.h>


#define PWM_BASE_CLOCK  SystemCoreClock
#define PWM_FREQUENCY   ((unsigned int)200)
#define PWM_PERIOD      ((SystemCoreClock/PWM_FREQUENCY) - 1)

class CILED i_led;

volatile unsigned char g_i_led_state;
volatile unsigned char g_i_led_mode;
volatile unsigned int g_i_led_param;
volatile unsigned int g_i_led_cnt;
volatile unsigned char g_i_led_pwm;


CILED::CILED()
{

}

CILED::~CILED()
{

}


void i_led_set_pwm(unsigned int pwm)
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


  TIM_OCInitStructure.TIM_Pulse = (pwm*(PWM_PERIOD-1))/(I_LED_MAX_BRIGHT+1);
  TIM_OC2Init(TIM15, &TIM_OCInitStructure);
}

void CILED::i_led_init()
{
  g_i_led_state = 0;
  g_i_led_mode = I_LED_MODE_OFF;
  g_i_led_cnt = 0;
  g_i_led_param = 0;
  g_i_led_pwm = 0;

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


  TIM_Cmd(TIM15, ENABLE);
  TIM_CtrlPWMOutputs(TIM15, ENABLE);

  i_led_set_pwm(0);


  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE);

  TIM_TimeBaseInitTypeDef timer_init_struct;
  timer_init_struct.TIM_Prescaler = 720;
  timer_init_struct.TIM_CounterMode = TIM_CounterMode_Up;
  timer_init_struct.TIM_Period = 1000 - 1;
  timer_init_struct.TIM_ClockDivision = TIM_CKD_DIV1;
  timer_init_struct.TIM_RepetitionCounter = 0;
  TIM_TimeBaseInit(TIM4, &timer_init_struct);

  TIM_Cmd(TIM4, ENABLE);

  TIM4->DIER |= TIM_DIER_UIE; // Enable interrupt on update event

  NVIC_InitTypeDef nvicStructure;
  nvicStructure.NVIC_IRQChannel = TIM4_IRQn;
  nvicStructure.NVIC_IRQChannelPreemptionPriority = 0;
  nvicStructure.NVIC_IRQChannelSubPriority = 1;
  nvicStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&nvicStructure);

  i_led_set(I_LED_MODE_ON);
}


void CILED::i_led_set(unsigned int mode, unsigned int param)
{
  g_i_led_mode = mode;
  g_i_led_param = param;
}


#ifdef __cplusplus
extern "C" {
#endif

void TIM4_IRQHandler()
{
  g_i_led_cnt++;

  unsigned int period = 0;

  switch (g_i_led_mode)
  {
    case I_LED_MODE_OFF:
                          g_i_led_pwm = 0;
                          break;

    case I_LED_MODE_ON:
                          g_i_led_pwm = I_LED_MAX_BRIGHT;
                          break;

    case I_LED_MODE_BLINKING:
                          period = g_i_led_param/5;
                          if (period < 2)
                            period = 2;
                          if ((g_i_led_cnt%period) > (period/2))
                            g_i_led_pwm = I_LED_MAX_BRIGHT;
                          else
                            g_i_led_pwm = 0;
                          break;

    case I_LED_MODE_PULSES_BLINKING:
                          if (((g_i_led_cnt/64)%16) < g_i_led_param)
                          {
                            period = 300/5;
                            if (period < 2)
                              period = 2;
                            if ((g_i_led_cnt%period) > (period/2))
                              g_i_led_pwm = I_LED_MAX_BRIGHT;
                            else
                              g_i_led_pwm = 0;
                          }
                          else
                            g_i_led_pwm = 0;
                          break;

    case I_LED_MODE_BREATH:
                          switch (g_i_led_state)
                          {
                            case 0:
                                      if ((g_i_led_cnt%15)==0)
                                      {
                                        if (g_i_led_pwm < I_LED_MAX_BRIGHT)
                                          g_i_led_pwm++;
                                        else
                                          g_i_led_state = 1;
                                      }
                                      break;

                            case 1:
                                    if ((g_i_led_cnt%15)==0)
                                    {
                                      if (g_i_led_pwm > 0)
                                        g_i_led_pwm--;
                                      else
                                        g_i_led_state = 0;
                                    }
                                    break;
                        }
                        break;
  }

  TIM_SetCompare2(TIM15, (g_i_led_pwm*(PWM_PERIOD-1))/I_LED_MAX_BRIGHT);

  TIM_ClearITPendingBit(TIM4, TIM_IT_Update);
}


#ifdef __cplusplus
}
#endif
