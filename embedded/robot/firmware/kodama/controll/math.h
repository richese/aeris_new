#ifndef _MATH_H_
#define _MATH_H_

//mathematical functions library
//defined as global static class CMath math
//usage :
//extern class CMath math;
//math.method(param)


#define PI      ((float)3.141592654)

class CMath
{
  private:
    unsigned int __rnda__, __rndb__;

  public:
    CMath();
    ~CMath();

    //return absolute value of x
    float abs(float x);

    //return signum function (-1, 0 or 1)
    float sgn(float x);

    //map value x from interval <source_min, source_max> to <dest_min, dest_max> using linear transformation
    float map(float x, float source_min, float source_max, float dest_min = -1.0, float dest_max = 1.0);

    //TODO
    float atan(float x);
    float atan2(float y, float x);

    unsigned int rand();
    float rnd();
};

extern CMath math;

#endif
