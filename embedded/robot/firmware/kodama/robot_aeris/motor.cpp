#include "motor.h"

#include "i2c.h"

#define DRV8830_LEFT_ADDRESS		0xC0
#define DRV8830_RIGHT_ADDRESS	 0xC2

#define DRV8830_CONTROL_REG		 0x00
#define DRV8830_FAULT_REG			 0x01

 
CMotor::CMotor()
{
  motor_init();
}

CMotor::~CMotor()
{

}


void CMotor::motor_sleep()
{
  unsigned char tmp = (6<<2);
  i2c.write_reg(DRV8830_LEFT_ADDRESS, DRV8830_CONTROL_REG, tmp);
  i2c.write_reg(DRV8830_RIGHT_ADDRESS, DRV8830_CONTROL_REG, tmp);
}

int32_t CMotor::motor_init()
{
  unsigned int i;

  for (i = 0; i < MOTORS_COUNT; i++)
    set_motor(i, 0);

  motor_refresh();

  return 0;
}

void CMotor::set_motor(uint32_t motor_id, int32_t value)
{
  if (motor_id < MOTORS_COUNT)
    motors[motor_id] = value;

  motor_refresh();
}


void CMotor::motor_refresh()
{
  int32_t tmp_left = motors[MOTOR_LEFT];
	int32_t tmp_right = motors[MOTOR_RIGHT];


	if (tmp_left > SPEED_MAX)
		tmp_left = SPEED_MAX;

	if (tmp_left < -SPEED_MAX)
		tmp_left = -SPEED_MAX;

	if (tmp_right > SPEED_MAX)
		tmp_right = SPEED_MAX;

	if (tmp_right < -SPEED_MAX)
		tmp_right = -SPEED_MAX;


	unsigned char tmp = 0;

	if (tmp_left == 0)
	{
		tmp = (6<<2)|(1<<1)|(1<<0); //break
	}
	else
	{
		if (tmp_left > 0)
		{
			if (tmp_left < 6)					 //minimum voltage, see datasheet
				tmp_left = 6;

			tmp = (tmp_left<<2)|(1<<1); //set speed and way
		}
		else
		{
			tmp_left = -tmp_left;
			if (tmp_left < 6)					 //minimum voltage, see datasheet
				tmp_left = 6;

			tmp = (tmp_left<<2)|(1<<0); //set speed and way
		}
	}

	i2c.write_reg(DRV8830_LEFT_ADDRESS, DRV8830_CONTROL_REG, 0);
	i2c.write_reg(DRV8830_LEFT_ADDRESS, DRV8830_CONTROL_REG, tmp);


	if (tmp_right == 0)
	{
		tmp = (6<<2)|(1<<1)|(1<<0); //break
	}
	else
	if (tmp_right > 0)
	{
		if (tmp_right < 6)					 //minimum voltage, see datasheet
			tmp_right = 6;

		tmp = (tmp_right<<2)|(1<<0); //set speed and way
	}
	else
	{
		tmp_right = -tmp_right;
		if (tmp_right < 6)					 //minimum voltage, see datasheet
			tmp_right = 6;

		tmp = (tmp_right<<2)|(1<<1); //set speed and way
	}

	i2c.write_reg(DRV8830_RIGHT_ADDRESS, DRV8830_CONTROL_REG, 0);
	i2c.write_reg(DRV8830_RIGHT_ADDRESS, DRV8830_CONTROL_REG, tmp);

}
