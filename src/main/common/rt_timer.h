#ifndef _RT_TIMER_H_
#define _RT_TIMER_H_

#include <thread>


class CRT_Timer
{
  private:

    bool run;
    std::thread rt_thread;
    float period_ms;

  public:
    CRT_Timer();
    virtual ~CRT_Timer();

    void rt_timer_set_period(float period_ms);
    int rt_timer_start();
    void rt_timer_stop();

    double rt_timer_get_ms_time();
    void rt_timer_delay_ms(float delay_time_ms);

  private:
    void rt_timer_thread_func();


  protected:
    virtual void rt_timer_callback() = 0;

};


#endif /* _RT_TIMER_H_ */
