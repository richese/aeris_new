#include "pid.h"

CPID::CPID(float kp, float ki, float kd, float output_range_)
{
  init(kp, ki, kd, output_range_);
}

CPID::~CPID()
{

}

void CPID::init(float kp, float ki, float kd, float output_range_)
{
  e0 = 0.0;
  e1 = 0.0;
  e2 = 0.0;

  k0 = kp + ki + kd;
  k1 = -kp -2.0*kd;
  k2 = kd;

  u = 0.0;

  this->output_range = output_range_;
}


float CPID::process(float error)
{
  e2 = e1;
  e1 = e0;
  e0 = error;

  u+= k0*e0 + k1*e1 + k2*e2;

  if (u > output_range)
    u = output_range;

  if (u < -output_range)
    u = -output_range;

  return u;
}
