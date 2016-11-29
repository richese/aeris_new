#include "math.h"

#include <stdint.h>

class CMath math;

CMath::CMath()
{
  __rnda__ = 1;
  __rndb__  = 2;
}

CMath::~CMath()
{

}

float CMath::abs(float x)
{
  if (x < 0.0)
    x = -x;
  return x;
}

float CMath::sgn(float x)
{
  if (x > 0.0)
    return 1.0;
  if (x < 0.0)
    return -1.0;
  return 0.0;
}

float CMath::map(float x, float source_min, float source_max, float dest_min, float dest_max)
{
  float k = (dest_max - dest_min)/(source_max - source_min);
  float q = dest_max - k*source_max;

  return k*x + q;
}






float CMath::atan(float x )
{
  return PI*0.25*x - x*(abs(x) - 1.0)*(0.2447 + 0.0663*abs(x));
}

float CMath::atan2(float y, float x )
{
  float res = 0.0;

  if (x > 0.0)
    res = atan(y/x);
  else
  if ((x < 0.0) && (y >= 0.0))
    res = atan(y/x) + PI;
  else
  if ((x < 0.0) && (y < 0.0))
    res = atan(y/x) - PI;
  else
  if ((x == 0.0) && (y > 0.0))
    res = PI/2.0;
  else
  if ((x == 0.0) && (y > 0.0))
    res = -PI/2.0;

  return res;
}

unsigned int CMath::rand()
{
  __rnda__ = __rnda__ *(unsigned int)1103515245 + (unsigned int)12345;
	__rndb__ = (__rndb__ >> 1) ^ (-(__rndb__ & 1u) & 0xD0000001u);

	return (__rnda__ ^ __rndb__);
}

float CMath::rnd()
{
  return (rand()%2000000)/1000000.0 - 1.0;
}
