#include "imu.h"
#include "lsm9ds0_regs.h"
#include "i2c.h"
#include "../controll/math.h"

CIMU::CIMU()
{

}

CIMU::~CIMU()
{

}

int32_t CIMU::imu_init()
{
  uint8_t tmp;

  imu_ms_dt = 10;

  gx_ofs = 0;
  gy_ofs = 0;
  gz_ofs = 0;

  roll = 0;
  pitch = 0;
  yaw = 0;


  uint32_t loops = 10000;
  while (loops--)
    __asm("nop");

  //check gyro who am I register
  tmp = i2c.read_reg(LSM9DS0_GYRO_ADDRESS, LSM9DS0_WHO_AM_I_G);
  if ( tmp != ((1<<7)|(1<<6)|(1<<4)|(1<<2)) )
      return -1;

  //check magnetometer and accelerometer who am I register
  tmp = i2c.read_reg(LSM9DS0_ACC_MAG_ADDRESS, LSM9DS0_WHO_AM_I_XM);
  if (tmp != ((1<<6)|(1<<3)|(1<<0)) )
      return -2;


  //gyrosocpe init
  //enable all axis, power up, maximum data output rate - 100Hz
  i2c.write_reg(LSM9DS0_GYRO_ADDRESS, LSM9DS0_CTRL_REG1_G, (1<<7)|(1<<6)|(1<<5)|(1<<4)|
                                                          (1<<3)|(1<<2)|(1<<1)|(1<<0));

  //2000DPS range
  //i2c_write_reg(LSM9DS0_GYRO_ADDRESS, LSM9DS0_CTRL_REG4_G, (1<<5));

  //500DPS range
  i2c.write_reg(LSM9DS0_GYRO_ADDRESS, LSM9DS0_CTRL_REG4_G, (1<<4));


  //accelerometer init
  i2c.write_reg(LSM9DS0_ACC_MAG_ADDRESS, LSM9DS0_CTRL_REG0_XM, 0);

  //enable all axis, data rate 100Hz
  i2c.write_reg(LSM9DS0_ACC_MAG_ADDRESS, LSM9DS0_CTRL_REG1_XM, (1<<6)|(1<<5)|(1<<2)|(1<<1)|(1<<0));

  //2g full range
  i2c.write_reg(LSM9DS0_ACC_MAG_ADDRESS, LSM9DS0_CTRL_REG2_XM, 0);



/*
  //magnetometer init
  // enable temperature sensor, high resolution, 100Hz outout rate
  i2c.write_reg(LSM9DS0_ACC_MAG_ADDRESS, LSM9DS0_CTRL_REG5_XM, (1<<7)|(1<<6)|(1<<5)|(1<<4)|(1<<2));

  //2 guass range
  i2c.write_reg(LSM9DS0_ACC_MAG_ADDRESS, LSM9DS0_CTRL_REG6_XM, 0);

  //continuous normal mode
  i2c.write_reg(LSM9DS0_ACC_MAG_ADDRESS, LSM9DS0_CTRL_REG7_XM, 1<<7);
*/

  loops = 100000;
  while (loops--)
    __asm("nop");

  imu_read();


  uint32_t i, measurments = 100;

  int32_t gx_ofs_sum = 0;
  int32_t gy_ofs_sum = 0;
  int32_t gz_ofs_sum = 0;

  for (i = 0; i < measurments; i++)
  {
      loops = 100;
      while (loops--)
        __asm("nop");

      imu_read();
      gx_ofs_sum+= imu_result.gx;
      gy_ofs_sum+= imu_result.gy;
      gz_ofs_sum+= imu_result.gz;
  }

  gx_ofs = gx_ofs_sum / (int32_t)measurments;
  gy_ofs = gy_ofs_sum / (int32_t)measurments;
  gz_ofs = gz_ofs_sum / (int32_t)measurments;

  imu_result.ax = 0;
  imu_result.ay = 0;
  imu_result.az = 0;

  imu_result.gx = 0;
  imu_result.gy = 0;
  imu_result.gz = 0;


  imu_result.roll = 0;
  imu_result.pitch = 0;
  imu_result.yaw = 0;

  //success
  return 0;
}

void CIMU::imu_read()
{
  int16_t tmp;


  i2c.Start();
  i2c.Write(LSM9DS0_GYRO_ADDRESS);  // slave address, write command
  i2c.Write(LSM9DS0_OUT_X_L_G|0x80);  // send reg address, auto increment address

  i2c.Start();
  i2c.Write(LSM9DS0_GYRO_ADDRESS|0x01); // slave address, read command

  tmp = (uint16_t)i2c.Read(1);   //read data
  tmp|= ((uint16_t)i2c.Read(1))<<8;   //read data
  imu_result.gx = tmp;

  tmp = (uint16_t)i2c.Read(1);   //read data
  tmp|= ((uint16_t)i2c.Read(1))<<8;   //read data
  imu_result.gy = tmp;

  tmp = (uint16_t)i2c.Read(1);   //read data
  tmp|= ((uint16_t)i2c.Read(0))<<8;   //read data
  imu_result.gz = tmp;

  i2c.Stop();


  i2c.Start();
  i2c.Write(LSM9DS0_ACC_MAG_ADDRESS);  // slave address, write command
  i2c.Write(LSM9DS0_OUT_X_L_A|0x80);  // send reg address, auto increment address

  i2c.Start();
  i2c.Write(LSM9DS0_ACC_MAG_ADDRESS|0x01); // slave address, read command

  tmp = (uint16_t)i2c.Read(1);   //read data
  tmp|= ((uint16_t)i2c.Read(1))<<8;   //read data
  imu_result.ax = tmp;

  tmp = (uint16_t)i2c.Read(1);   //read data
  tmp|= ((uint16_t)i2c.Read(1))<<8;   //read data
  imu_result.ay = tmp;

  tmp = (uint16_t)i2c.Read(1);   //read data
  tmp|= ((uint16_t)i2c.Read(0))<<8;   //read data
  imu_result.az = tmp;

  i2c.Stop();

  roll+= ((int32_t)imu_result.gy - gy_ofs)/(int32_t)200;
  imu_result.roll = (imu_ms_dt*85*roll)/2530;

  pitch+= ((int32_t)imu_result.gx - gx_ofs)/(int32_t)200;
  imu_result.pitch = (imu_ms_dt*85*pitch)/2530;

  yaw+= ((int32_t)imu_result.gz - gz_ofs)/(int32_t)200;
  imu_result.yaw = (imu_ms_dt*85*yaw)/2530;
}

struct sIMUSensor* CIMU::get_imu_result()
{
  return &imu_result;
}
