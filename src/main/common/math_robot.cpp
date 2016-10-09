#include "math_robot.h"

#include <stdlib.h>
#include <math.h>


double m_rnd()
{
  return (rand()%200000000)/100000000.0 - 1.0;
}

double m_abs(double x)
{
  if (x < 0.0)
    x = -x;

  return x;
}

double m_sgn(double x)
{
  if (x > 0.0)
    return 1.0;

  if (x < 0.0)
    return -1.0;

  return 0.0;
}


double m_min(double a, double b)
{
  if (a < b)
    return a;
  else
    return b;
}

double m_max(double a, double b)
{
  if (a > b)
    return a;
  else
    return b;
}


double m_saturate(double value_min, double value_max, double x)
{
  if (x < value_min)
    x = value_min;

  if (x > value_max)
    x = value_max;

  return x;
}

double m_map_to(double source_min, double source_max, double dest_min, double dest_max, double value)
{
  double k = (dest_max - dest_min)/(source_max - source_min);
  double q = source_min - k*source_min;
  return k*value + q;
}

double m_mix(double a, double b, double ratio)
{
  return ratio*a + (1.0 - ratio)*b;
}


double robot_distance(struct sAgentPosition *pa, struct sAgentPosition *pb)
{
  double res = 0.0;
  res+= (pa->x - pb->x)*(pa->x - pb->x);
  res+= (pa->y - pb->y)*(pa->y - pb->y);
  res+= (pa->z - pb->z)*(pa->z - pb->z);

  return sqrt(res);
}
