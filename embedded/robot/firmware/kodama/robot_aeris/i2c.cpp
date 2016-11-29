#include "i2c.h"
#include <device.h>

CI2C i2c;

CI2C::CI2C()
{

}

CI2C::~CI2C()
{

}

void CI2C::init()
{
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIO_I2C, ENABLE);

    GPIO_InitTypeDef GPIO_InitStruct;

    GPIO_InitStruct.GPIO_Pin = (1<<SDA)|(1<<SCL);
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(I2C_GPIO, &GPIO_InitStruct);

    SetHighSCL();
    SetLowSDA();
    SetHighSDA();
}



void CI2C::Start()
{
    SetHighSCL();
    SetHighSDA();

    SetHighSCL();
    SetLowSDA();

    SetLowSCL();
    SetHighSDA();
}


void CI2C::Stop()
{
    SetLowSCL();
    SetLowSDA();

    SetHighSCL();
    SetLowSDA();

    SetHighSCL();
    SetHighSDA();
}



int CI2C::Write(uint8_t a)
{
    uint8_t  i;
    uint8_t  return_ack;

    for (i=0; i<8; i++)
    {
        SetLowSCL();

        if (a & 0x80)
            SetHighSDA();
        else
            SetLowSDA();

        SetHighSCL();
        a <<= 1;
    }

    SetLowSCL();
    SetHighSDA();
    SetHighSCL();


    if (I2C_GPIO->IDR&(1<<SDA))
        return_ack = NO_I2C_ACK;
    else
        return_ack = OK_I2C_ACK;

    SetLowSCL();

    delay();

    return(return_ack);
}


uint8_t CI2C::Read(uint8_t  ack)
{
    uint8_t  i;
    uint8_t  c = 0x00;

    SetLowSCL();

    for (i = 0; i < 8; i++)
    {
        c = c << 1;
        SetHighSCL();

        if (I2C_GPIO->IDR&(1<<SDA))
            c = c | 0x01;

        SetLowSCL();
    }


  	if(ack)
  	{
      SetLowSDA();
  	}
  	else
  	{
      SetHighSDA();
  	}

    SetHighSCL();
    SetLowSCL();

    SetHighSDA();

/*
   if (ack > 0)
   {
     //0
      SetLowSDA();
      SetHighSCL();
      SetLowSCL();
    //  SetHighSDA();

   }
   else
   {
     //1
     SetHighSDA();
     SetHighSCL();
     SetLowSCL();
  //   SetLowSDA();
   }
*/
  return (c);
}


void CI2C::write_reg(uint8_t dev_adr, uint8_t reg_adr, uint8_t value)
{
    Start();
    Write(dev_adr);  /*slave address, write command*/
    Write(reg_adr);  /*send reg address*/
    Write(value);
    Stop();
}

uint8_t CI2C::read_reg(uint8_t dev_adr, uint8_t reg_adr)
{
    uint8_t res;

    Start();
    Write(dev_adr);  /*slave address, write command*/
    Write(reg_adr);  /*send reg address*/

    Start();
    Write(dev_adr|0x01); /*slave address, read command*/
    res = Read(0);   /*read data*/
    Stop();

    return res;
}



void CI2C::delay()
{
  uint32_t loops = 10;
  while (loops--)
      __asm("nop");
}

void CI2C::SetLowSDA()
{
    //TODO rewrite without GPIO_InitTypeDef
    GPIO_InitTypeDef GPIO_InitStruct;

    GPIO_InitStruct.GPIO_Pin = (1<<SDA);
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(I2C_GPIO, &GPIO_InitStruct);

    /*
    I2C_GPIO->OTYPER &= ~((GPIO_OTYPER_OT_0) << ((uint16_t)SDA));
    I2C_GPIO->OTYPER |= (uint16_t)(((uint16_t)GPIO_OType_OD) << ((uint16_t)SDA));

    I2C_GPIO->MODER  &= ~(GPIO_MODER_MODER0 << (SDA * 2));
    I2C_GPIO->MODER |= (((uint32_t)GPIO_Mode_IN) << (SDA * 2));
    */
    I2C_GPIO->BRR = (1<<SDA);

    delay();
}

void CI2C::SetHighSDA()
{
  /*
    GPIO_InitTypeDef GPIO_InitStruct;

    GPIO_InitStruct.GPIO_Pin = (1<<SDA);
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(I2C_GPIO, &GPIO_InitStruct);
*/

    I2C_GPIO->MODER  &= ~(GPIO_MODER_MODER0 << (SDA * 2));
    I2C_GPIO->MODER |= (((uint32_t)GPIO_Mode_IN) << (SDA * 2));

    I2C_GPIO->BSRR = (1<<SDA);

    delay();
}

void CI2C::SetLowSCL()
{
    I2C_GPIO->BRR = (1<<SCL);
    delay();
}

void CI2C::SetHighSCL()
{
    I2C_GPIO->BSRR = (1<<SCL);
    delay();
}
