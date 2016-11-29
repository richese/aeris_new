#include "rgb_i2c.h"
#include <device.h>

#define RGB_I2C_DELAY_LOOPS 100


CRGB_I2C::CRGB_I2C()
{

}

CRGB_I2C::~CRGB_I2C()
{

}



void CRGB_I2C::rgb_i2c_init()
{
	unsigned int i;

	GPIO_InitTypeDef GPIO_InitStruct;

	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SCL);
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP; // this sets the pin type to open drain
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor

	GPIO_Init(GPIOC, &GPIO_InitStruct);


	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);

	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	GPIO_SetBits(GPIOA, (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3));

	RGBSetHighSCL();
	RGBSetLowSDA();
	RGBSetHighSDA();

	i = 10000;
	while (i--)
		__asm("nop");
}



void CRGB_I2C::rgb_i2cStart()
{
	RGBSetHighSCL();
	RGBSetHighSDA();

	RGBSetHighSCL();
	RGBSetLowSDA();

	RGBSetLowSCL();
	RGBSetHighSDA();
}


void CRGB_I2C::rgb_i2cStop()
{
	RGBSetLowSCL();
	RGBSetLowSDA();

	RGBSetHighSCL();
	RGBSetLowSDA();

	RGBSetHighSCL();
	RGBSetHighSDA();
}



void CRGB_I2C::rgb_i2cWrite(unsigned char a)
{
	unsigned char	i;

	for (i = 0; i < 8; i++)
	{
		RGBSetLowSCL();

		if (a & 0x80)
			RGBSetHighSDA();
		else
			RGBSetLowSDA();

		RGBSetHighSCL();
		a <<= 1;
	}

	RGBSetLowSCL();
	RGBSetHighSDA();
	RGBSetHighSCL();

	RGBSetLowSCL();

	rgb_i2c_delay();
}


void CRGB_I2C::rgb_i2cRead(unsigned char ack, unsigned char *result)
{
	unsigned int	i, j;

	for (i = 0; i < RGB_SENSORS_COUNT; i++)
		result[i] = 0x00;

	RGBSetLowSCL();
	RGBSetHighSDA();

	for (i = 0; i < 8; i++)
	{
		for (j = 0; j < RGB_SENSORS_COUNT; j++)
			result[j] = result[j] << 1;

		RGBSetHighSCL();

		unsigned int tmp = GPIOA->IDR;

		if (tmp&(1<<RGB_SDA_0))
				result[0]|= 1;

		if (tmp&(1<<RGB_SDA_1))
				result[1]|= 1;

		if (tmp&(1<<RGB_SDA_2))
				result[2]|= 1;

		if (tmp&(1<<RGB_SDA_3))
				result[3]|= 1;

		RGBSetLowSCL();
	}

	if (ack)
	{
		RGBSetLowSDA();
	}

	RGBSetHighSCL();
	RGBSetLowSCL();

	rgb_i2c_delay();
}


void CRGB_I2C::rgb_i2c_write_reg(unsigned char dev_adr, unsigned char reg_adr, unsigned char value)
{
	rgb_i2cStart();
	rgb_i2cWrite(dev_adr);	/*slave address, write command*/
	rgb_i2cWrite(reg_adr);	/*send reg address*/
	rgb_i2cWrite(value);
	rgb_i2cStop();
}

void CRGB_I2C::rgb_i2c_read_reg(unsigned char dev_adr, unsigned char reg_adr, unsigned char *res)
{
	rgb_i2cStart();
	rgb_i2cWrite(dev_adr);	/*slave address, write command*/
	rgb_i2cWrite(reg_adr);	/*send reg address*/

	rgb_i2cStart();
	rgb_i2cWrite(dev_adr|0x01); /*slave address, read command*/
	rgb_i2cRead(0, res);	 /*read data*/
	rgb_i2cStop();
}




void CRGB_I2C::rgb_i2c_delay()
{
	unsigned int loops = RGB_I2C_DELAY_LOOPS;
	while (loops--)
		__asm("nop");
}

void CRGB_I2C::RGBSetLowSDA()
{
	GPIO_InitTypeDef GPIO_InitStruct;

	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	GPIOA->BRR = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);

	rgb_i2c_delay();
}

void CRGB_I2C::RGBSetHighSDA()
{
	GPIO_InitTypeDef GPIO_InitStruct;

	GPIO_InitStruct.GPIO_Pin = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);

	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	GPIOA->BSRR = (1<<RGB_SDA_0)|(1<<RGB_SDA_1)|(1<<RGB_SDA_2)|(1<<RGB_SDA_3);
	rgb_i2c_delay();
}

void CRGB_I2C::RGBSetLowSCL()
{
	GPIOC->BRR = 1<<RGB_SCL;
	rgb_i2c_delay();
}

void CRGB_I2C::RGBSetHighSCL()
{
	GPIOC->BSRR = 1<<RGB_SCL;
	rgb_i2c_delay();
}
