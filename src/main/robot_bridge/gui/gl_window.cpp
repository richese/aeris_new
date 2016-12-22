#include "gl_window.h"

#include <GL/gl.h>
#include <GL/glx.h>
#include <GL/glu.h>
#include <GL/freeglut.h>
#include <GL/glut.h>
#include <GL/glext.h>

#include "../bridge_interface.h"

extern class CBridgeInterface *bridge_interface;
extern int g_selected_robot;

CGLWindow::CGLWindow(int X, int Y, int W, int H, const char *L): Fl_Gl_Window(X, Y, W, H, L)
{

  angle = 0.0;

  Fl::add_timeout(1.0/24.0, callback_timer_static, (void*)this);       // 24fps timer
  end();
}



void CGLWindow::callback_timer_static(void *userdata)
{
  CGLWindow *instance = (CGLWindow*)userdata;
  instance->redraw();
  Fl::repeat_timeout(1.0/24.0, callback_timer_static, userdata);
}


CGLWindow::~CGLWindow()
{

}

void CGLWindow::draw()
{
  // printf("GUI : GL draw\n");

  struct sBridgeResult result = bridge_interface->get(g_selected_robot);

  if (!valid())
  {
    valid(1);

    glViewport(0,0, w(),h());
    glOrtho(-1.0, 1.0,-1.0, 1.0, -1, 1);

    glMatrixMode(GL_MODELVIEW);

    glMatrixMode(GL_PROJECTION);
    //glEnable(GL_DEPTH_TEST);

    glLoadIdentity();
  }

  angle+= 1.0;
  glLoadIdentity();

  glClearColor(0.0, 0.0, 0.0, 0.0);

  glColor3f(0.0, 0.0, 0.0);

  float size = 1.0;
  glBegin(GL_QUADS);
  glVertex3f(size, -size, 0.0);
	glVertex3f(size, size, 0.0);
	glVertex3f(-size, size, 0.0);
	glVertex3f(-size, -size, 0.0);
  glEnd();


  glPushMatrix();

  glTranslatef(0.0, 0.0, 0.0);

  glRotatef(result.roll, 0.0, 1.0, 0.0);
  glRotatef(result.pitch, 1.0, 0.0, 0.0);
  glRotatef(result.yaw, 0.0, 0.0, 1.0);

  glColor3f(1.0, 1.0, 0.0);


  glBegin(GL_TRIANGLES);
  glVertex3f(-1.0, -1.0, 0.0);
  glVertex3f(1.0, 1.0, 0.0);
  glVertex3f(1.0, -1.0, 0.0);
  glEnd();

  glPopMatrix();

}

void CGLWindow::redraw()
{
  draw();

  Fl::redraw();
}

int CGLWindow::handle(int param)
{
  return 0;
}
