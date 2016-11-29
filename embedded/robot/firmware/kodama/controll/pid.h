#ifndef _PID_H_
#define _PID_H_

#include <stdint.h>

//discrete PID controller implementation

class CPID
{
  private:
    float e0, e1, e2;
    float k0, k1, k2;
    float u, output_range;

  public:
    //create controller
    //@param kp - proportional constant
    //@param ki - integration constant
    //@param kd - derivative constant
    //@param output_range - maximum otput range, limits output into <-output_range, output_range>
    CPID(float kp, float ki, float kd, float output_range_);
    ~CPID();

    //new initialization of parameters see CPID
    void init(float kp, float ki, float kd, float output_range_);

    //process one discrete controller step
    //@param error, required_value - meassured_value
    //return controller output
    float process(float error);
};


#endif
