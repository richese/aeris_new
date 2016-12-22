#ifndef _GL_WINDOW_H_
#define _GL_WINDOW_H_

#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/gl.h>
#include <FL/Fl_Gl_Window.H>

class CGLWindow : public Fl_Gl_Window
{
  private:
    // bool valid;

  public:
    CGLWindow(int X, int Y, int W, int H, const char *L);
    ~CGLWindow();

    void draw();
    int handle(int param);
};


#endif
