#ifndef _ASSOCIATIVE_MEMORY_H_
#define _ASSOCIATIVE_MEMORY_H_


#include "math_vector.h"
#include "math.h"

template <int input_size, int output_size, int hard_locations_count> class AssociativeMemory
{
  private:
    Vector<MathVector<input_size>, hard_locations_count> hard_locations;
    Vector<MathVector<output_size>, hard_locations_count> output_values;

    unsigned int used_hard_locations;

    float learning_rate;

  public:
    AssociativeMemory()
    {

    }

    ~AssociativeMemory()
    {

    }

    void init()
    {
      used_hard_locations = hard_locations_count/2;
      learning_rate = 0.1;
      unsigned int i, j;

      for (j = 0; j < hard_locations_count; j++)
        for (i = 0; i < input_size; i++)
        {
          hard_locations[j][i] = math.rnd();
        }

      for (j = 0; j < hard_locations_count; j++)
        for (i = 0; i < output_size; i++)
          output_values[j][i] = 0.0;
    }

    void save(MathVector<input_size> &input, MathVector<output_size> &required_output)
    {
      unsigned int j;
      unsigned int min_idx = 0;
      float min_value = 100000000.0, tmp;
      for (j = 0; j < used_hard_locations; j++)
        if ((tmp = hard_locations[j].distance(input)) < min_value)
        {
          min_idx = j;
          min_value = tmp;
        }

     if (used_hard_locations < hard_locations.size())
      {
        hard_locations[used_hard_locations].mix(input, 1.0);
        output_values[used_hard_locations].mix(required_output, 1.0);
        used_hard_locations++;
      }
      else
      {
        hard_locations[min_idx].mix(input, learning_rate);
        output_values[min_idx].mix(required_output, learning_rate);
      }
    }


    void load(MathVector<input_size> &input, MathVector<output_size> &result)
    {
      unsigned int j;
      unsigned int min_idx = 0;
      float min_value = 100000000.0, tmp;
      for (j = 0; j < used_hard_locations; j++)
        if ((tmp = hard_locations[j].distance(input)) < min_value)
        {
          min_idx = j;
          min_value = tmp;
        }

      result.mix(output_values[min_idx], 1.0);
    }

    float get_hard_location_by_idx(unsigned int hard_location_idx, unsigned int state_item_idx)
    {
      return hard_locations[hard_location_idx][state_item_idx];
    }

    float get_output_by_idx(unsigned int hard_location_idx, unsigned int output_idx)
    {
      return output_values[hard_location_idx][output_idx];
    }
};

#endif
