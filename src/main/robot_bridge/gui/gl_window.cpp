#include "gl_window.h"

#include <GL/gl.h>
#include <GL/glx.h>
#include <GL/glu.h>
#include <GL/freeglut.h>
#include <GL/glut.h>
#include <GL/glext.h>

CGLWindow::CGLWindow(int X, int Y, int W, int H, const char *L): Fl_Gl_Window(X, Y, W, H, L)
{

}

CGLWindow::~CGLWindow()
{

}

void CGLWindow::draw()
{
  Fl::lock();

  if(!valid())
  {
    valid(1);

    glLoadIdentity();
    glViewport(0,0,w(),h());
    glOrtho(-w(),w(),-h(),h(), -1, 1);

    glMatrixMode(GL_MODELVIEW);


    printf("GL init done\n");
  }

  printf("GL draw\n");
  //TODO : segmentation fault

/*
  glClearColor(1.0,0.0,1.0,1.0);

  glColor3f(0.0, 1.0, 0.0);


  /*
  glBegin(GL_TRIANGLE_STRIP);
  glVertex2f(-60.0, -60.0);
  glVertex2f(30.0, 10.0);
  glVertex2f(50.0, -50.0);
  glEnd();

  glFlush();
*/
  Fl::unlock();
}

int CGLWindow::handle(int param)
{
  return 0;
}
