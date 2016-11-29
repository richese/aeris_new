#include "error.h"

#include <device.h>

CError::CError()
{

}

CError::~CError()
{

}

void CError::error_func(int error)
{
  uint32_t loops, i;
  (void)error;

  while (1)
  {
    for (i = 0; i < 10; i++)
    {
      GPIOB->BSRR = (1<<15);

      loops = 100000;
      while (loops--) __asm("nop");


      GPIOB->BRR = (1<<15);

      loops = 1000000;
      while (loops--) __asm("nop");
    }

    loops = 3000000;
    while (loops--) __asm("nop");
  }
}
