#include "math_robot.h"

#include <stdlib.h>
#include <math.h>


float m_rnd()
{
  return (rand()%200000000)/100000000.0 - 1.0;
}

float m_abs(float x)
{
  if (x < 0.0)
    x = -x;

  return x;
}

float m_sgn(float x)
{
  if (x > 0.0)
    return 1.0;

  if (x < 0.0)
    return -1.0;

  return 0.0;
}

float m_saturate(float value_min, float value_max, float x)
{
  if (x < value_min)
    x = value_min;

  if (x > value_max)
    x = value_max;

  return x;
}

float m_map_to(float source_min, float source_max, float dest_min, float dest_max, float value)
{
  float k = (dest_max - dest_min)/(source_max - source_min);
  float q = source_min - k*source_min;
  return k*value + q;
}

float m_mix(float a, float b, float ratio)
{
  return ratio*a + (1.0 - ratio)*b;
}
