#ifndef _MATH_VECTOR_
#define _MATH_VECTOR_

#include "vector.h"

//MathVector class : vector of floats with specified size
//some basic operators are implemented such : length. distance, dot and mix

template <unsigned int size_> class MathVector: public Vector<float, size_>
{
  public:
    //init vector of size_ with 0.0 values
    MathVector()
    {
      init();
    }

    ~MathVector()
    {

    }

    void init()
    {
      unsigned int i;
      for (i = 0; i < size_; i++)
        this->arr[i] = 0.0;
    }

    //return squre vector length
    float length()
    {
      unsigned int i;
      float result = 0.0;
      for (i = 0; i < size_; i++)
        result+= this->arr[i]*this->arr[i];

      return result;
    }

    //return square vectors distance
    //@param v - second vector
    float distance(class MathVector &v)
    {
      unsigned int i;
      float result = 0.0;
      for (i = 0; i < size_; i++)
      {
        float tmp = v[i]-this->arr[i];
        result+= tmp*tmp;
      }
      return result;
    }

    //return vectors dot product
    //@param v - second vector
    float dot(class MathVector &v)
    {
      unsigned int i;
      float result = 0.0;
      for (i = 0; i < size_; i++)
        result+= v[i]*this->arr[i];

      return result;
    }

    //mix two vectors using formula this = (1.0 - ratio)*this + ratio*v
    //ratio must be in range <0, 1>
    //example : ratio = 0.5 -> result is vectors average value
    //example : ratio = 1.0 (default) -> result is copyed new vector
    //@param v - second vector, 1.0 default
    //@param ratio - vectors mixing ratio
    void mix(class MathVector &v, float ratio = 1.0)
    {
      unsigned int i;
      for (i = 0; i < size_; i++)
        this->arr[i] = (1.0 - ratio)*this->arr[i] + ratio*v[i];
    }
};


#endif
