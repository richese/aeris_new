#ifndef _MATH_ROBOT_H_
#define _MATH_ROBOT_H_

#include "point3d.h"

double m_rnd();
double m_abs(double x);
double m_sgn(double x);
double m_saturate(double value_min, double value_max, double x);
double m_map_to(double source_min, double source_max, double dest_min, double dest_max, double value);
double m_mix(double a, double b, double ratio);
double robot_distance(struct sAgentPosition *pa, struct sAgentPosition *pb);

#endif
