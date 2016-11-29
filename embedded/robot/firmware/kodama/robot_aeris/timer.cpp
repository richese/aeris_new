#include "timer.h"

#include <device.h>

class CTimer timer;

volatile time_t __system_time__;


volatile uint32_t __event_timer_cnt__[EVENT_TIMER_COUNT];
volatile uint32_t __event_timer_csr__[EVENT_TIMER_COUNT];
volatile uint8_t __event_timer_flag__[EVENT_TIMER_COUNT];

#ifdef __cplusplus
extern "C" {
#endif

void TIM3_IRQHandler()
{
  uint32_t i;
  for (i = 0; i < EVENT_TIMER_COUNT; i++)
  {
     if ((__event_timer_flag__[i] != 0) && (__event_timer_flag__[i] < 255))
       __event_timer_flag__[i]++;

     if (__event_timer_cnt__[i])
       __event_timer_cnt__[i]--;
     else
     {
       __event_timer_cnt__[i] = __event_timer_csr__[i];
       if (__event_timer_flag__[i] == 0)
         __event_timer_flag__[i] = 1;
     }
  }

  __system_time__++;
  TIM_ClearITPendingBit(TIM3, TIM_IT_Update);
}

#ifdef __cplusplus
}
#endif

CTimer::CTimer()
{
  timer_init();
}

CTimer::~CTimer()
{

}

int32_t CTimer::timer_init()
{
  __system_time__ = 0;

  unsigned int i;

  for (i = 0; i < EVENT_TIMER_COUNT; i++)
  {
    __event_timer_cnt__[i] = 1024;
    __event_timer_csr__[i] = 1024;
    __event_timer_flag__[i] = 0;
  }

  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);

  TIM_TimeBaseInitTypeDef timer_init_struct;
  timer_init_struct.TIM_Prescaler = 280; //(84 - 1);
  timer_init_struct.TIM_CounterMode = TIM_CounterMode_Up;
  timer_init_struct.TIM_Period = 50 - 1;
  timer_init_struct.TIM_ClockDivision = TIM_CKD_DIV1;
  timer_init_struct.TIM_RepetitionCounter = 0;
  TIM_TimeBaseInit(TIM3, &timer_init_struct);

  TIM_Cmd(TIM3, ENABLE);

  TIM3->DIER |= TIM_DIER_UIE; // Enable interrupt on update event

  NVIC_InitTypeDef nvicStructure;
  nvicStructure.NVIC_IRQChannel = TIM3_IRQn;
  nvicStructure.NVIC_IRQChannelPreemptionPriority = 0;
  nvicStructure.NVIC_IRQChannelSubPriority = 1;
  nvicStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&nvicStructure);

  return 0;
}

time_t CTimer::get_time()
{
  volatile time_t time;

  __disable_irq();
  time = __system_time__;
  __enable_irq();

  return (time/10);
}

void CTimer::delay_loops(uint32_t loops)
{
  while (loops--)
    __asm("nop");
}

void CTimer::delay_ms(uint32_t time_ms)
{
  volatile time_t time_end = (time_t)time_ms + get_time();
  while (time_end > get_time())
    core_yield();
}


void CTimer::event_timer_set_period(uint8_t timer_id, uint32_t period_ms)
{
  __disable_irq();
	period_ms*= 10;
	__event_timer_cnt__[timer_id] = period_ms;
	__event_timer_csr__[timer_id] = period_ms;
	__event_timer_flag__[timer_id] = 0;
	__enable_irq();
}

uint8_t CTimer::event_timer_check(uint8_t timer_id)
{
  uint8_t res = 0;

  if (__event_timer_flag__[timer_id] != 0)
  {
		__disable_irq();
    res = __event_timer_flag__[timer_id];
	  __event_timer_flag__[timer_id] = 0;
	  __enable_irq();
  }

  return res;
}
