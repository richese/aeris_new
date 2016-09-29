#ifndef _MATH_ROBOT_H_
#define _MATH_ROBOT_H_


float m_rnd();
float m_abs(float x);
float m_sgn(float x);
float m_saturate(float value_min, float value_max, float x);
float m_map_to(float source_min, float source_max, float dest_min, float dest_max, float value);
float m_mix(float a, float b, float ratio);

#endif
