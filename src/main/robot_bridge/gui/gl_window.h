#ifndef _GL_WINDOW_H_
#define _GL_WINDOW_H_

#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/gl.h>
#include <FL/Fl_Gl_Window.H>

class CGLWindow : public Fl_Gl_Window
{
  private:
    float roll_fil;
    float pitch_fil;
    float yaw_fil;

  public:
    CGLWindow(int X, int Y, int W, int H, const char *L);
    ~CGLWindow();

  private:
    static void callback_timer_static(void *userdata);

    void draw();

    void redraw();
    int handle(int param);
};


#endif
