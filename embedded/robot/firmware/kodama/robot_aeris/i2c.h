#ifndef _I2C_H_
#define _I2C_H_

#include <stdint.h>

#define RCC_AHBPeriph_GPIO_I2C RCC_AHBPeriph_GPIOB
#define I2C_GPIO    GPIOB

#define SCL     	6
#define SDA     	7

#define NO_I2C_ACK 0
#define OK_I2C_ACK 1

class CI2C
{
  public:
    CI2C();
    ~CI2C();

    void init();

    void Start();
    void Stop();

    int Write(uint8_t a);
    uint8_t Read(uint8_t  ack);

    void write_reg(uint8_t dev_adr, uint8_t reg_adr, uint8_t value);
    uint8_t read_reg(uint8_t dev_adr, uint8_t reg_adr);

  private:
    void delay();
    void SetLowSDA();
    void SetHighSDA();

    void SetLowSCL();
    void SetHighSCL();
};

extern CI2C i2c;

#endif
