#include "line_position.h"




CLinePosition::CLinePosition()
{
  line_position = 0.0;
  on_line_ = 0;
}

CLinePosition::~CLinePosition()
{


}

void CLinePosition::process(struct sRGBResult *rgb_result)
{
  unsigned int i, min_idx;
  on_line_ = 0;

  min_idx = 0;
  for (i = 0; i < result_vect.size(); i++)
    if (rgb_result->ambient[i] < rgb_result->ambient[min_idx])
      min_idx = i;

  float min_value = rgb_result->ambient[min_idx];
  float threshold = -80.0;

  if (min_value < threshold)
  {
    float max = 0.0001;
    for (i = 0; i < result_vect.size(); i++)
    {
      result_vect[i] = -rgb_result->ambient[i];
      if (max < math.abs(result_vect[i]))
        max = math.abs(result_vect[i]);
    }

    for (i = 0; i < result_vect.size(); i++)
      result_vect[i]/= max;

    on_line_ = true;



    if (rgb_result->ambient[0] < threshold)
    {
      line_position = -1.0;
    }
    else
    if (rgb_result->ambient[3] < threshold)
    {
      line_position = 1.0;
    }
    else
    if (rgb_result->ambient[1] < threshold)
    {
      line_position = -0.5;
    }
    else
    if (rgb_result->ambient[2] < threshold)
    {
      line_position = 0.5;
    }
  }


  /*
  unsigned int i, min_idx;
  on_line_ = 0;

  min_idx = 0;
  for (i = 0; i < result_vect.size(); i++)
    if (rgb_result->ambient[i] < rgb_result->ambient[min_idx])
      min_idx = i;

  float min_value = rgb_result->ambient[min_idx];
  float threshold = -100.0;

  if (min_value < threshold)
  {
    for (i = 0; i < result_vect.size(); i++)
      result_vect[i] = -1.0;

    on_line_ = true;



    if (rgb_result->ambient[0] < threshold)
    {
      line_position = -1.0;
      result_vect[0] = 1.0;
    }
    else
    if (rgb_result->ambient[3] < threshold)
    {
      line_position = 1.0;
      result_vect[3] = 1.0;
    }
    else
    if (rgb_result->ambient[1] < threshold)
    {
      line_position = -0.5;
      result_vect[1] = 1.0;
    }
    else
    if (rgb_result->ambient[2] < threshold)
    {
      line_position = 0.5;
      result_vect[2] = 1.0;
    }

  }

  switch (min_idx)
  {
    case 0: line_position = -1.0; result_vect[min_idx] = 1.0; break;
    case 1: line_position = -0.5; result_vect[min_idx] = 1.0; break;
    case 2: line_position =  0.5; result_vect[min_idx] = 1.0; break;
    case 3: line_position =  1.0; result_vect[min_idx] = 1.0; break;
  }
*/

}

unsigned char CLinePosition::on_line()
{
  return on_line_;
}

float CLinePosition::get_line_position()
{
  return line_position;
}

void CLinePosition::get_vector(class MathVector<RGB_SENSORS_COUNT> *v)
{
  unsigned int i;
  for (i = 0; i < result_vect.size(); i++)
    (*v)[i] = result_vect[i];
}
