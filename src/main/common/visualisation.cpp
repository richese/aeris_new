#include <visualisation.h>
#include <debug.h>

#include <stdio.h>
#include <X11/X.h>
#include <X11/Xlib.h>
#include <GL/gl.h>
#include <GL/glx.h>
#include <GL/glu.h>
#include <GL/freeglut.h>
#include <GL/glut.h>
#include <GL/glext.h>
#include <glm/glm.hpp>


#include <configure.h>

extern class CConfigure g_configure;

CVisualisation::CVisualisation()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : visualisation created\n", (unsigned int long)this);
  #endif

  cm_size = g_configure.get_cm_size();

  opengl_enabled = true;
  if (opengl_enabled == true)
  {
    unsigned int window_width = g_configure.get_width_pixel();
    unsigned int window_height = g_configure.get_height_pixel();

    int num = 0;

    glutInit(&num, NULL);
    glutInitWindowSize(window_width, window_height);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE);
    glutCreateWindow("robot visualisation");

    //glutIdleFunc(visualise_idle);
    //glutKeyboardFunc(visualise_process_keys);

    glViewport(0, 0, window_width, window_height);
    glMatrixMode(GL_PROJECTION);
    glEnable(GL_DEPTH_TEST);
    gluPerspective(45, (float) window_width / window_height, 0.1, 2000);
    glMatrixMode(GL_MODELVIEW);
  }


  unsigned int j;
  for (j = 0; j < AGENT_BODY_TYPE_COUNT; j++)
    agent_body.push_back(new CAgentBody(j));

}


CVisualisation::~CVisualisation()
{
  unsigned int j;
  for (j = 0; j < agent_body.size(); j++)
    delete agent_body[j];

  #ifdef _DEBUG_COMMON_
  printf("%lu : visualisation destroyed\n", (unsigned int long)this);
  #endif
}


void CVisualisation::refresh(std::vector<struct sAgentInterface> *agent_interface)
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : visualisation refresh\n", (unsigned int long)this);
  #endif


  if (opengl_enabled)
  {
      glMatrixMode(GL_PROJECTION);
      glShadeModel(GL_SMOOTH);
      glEnable(GL_DEPTH_TEST);
      glMatrixMode(GL_MODELVIEW);

      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
      glLoadIdentity();

      glEnable(GL_DEPTH_TEST);
      glDepthFunc(GL_LEQUAL);

      glMatrixMode(GL_MODELVIEW);

      unsigned int g_view_state = 2;

      switch (g_view_state)
      {
        case 0:
              glTranslatef(0.0, 0.0, -800.0);
              glRotatef(0.0, 0.0, 0.0, 0.0);
              break;

        case 1:
              glTranslatef(0.0, 0.0, -4.0);
              glRotatef(0.0, 0.0, 0.0, 0.0);
              break;


        case 2:
              glTranslatef(0.0, 0.0, -1000.0);
              glRotatef(-70.0, 1.0, 0.0, 0.0);
              break;
      }

      glClearColor(0.0, 0.0, 0.0, 0.0);

      unsigned int max_y = 100;
      unsigned int max_x = (max_y*16.0)/9.0;
      unsigned int j, i;

      /*
      for (j = 0; j < max_y; j++)
        for (i = 0; i < max_x; i++)
        {
          if ((j%2) == (i%2))
            glColor3f(0.05, 0.05, 0.05);
          else
            glColor3f(0.0, 0.0, 0.0);

          float size = cm_size;
          float x = size*(i - max_x/2.0);
          float y = size*(j - max_y/2.0);


          glBegin(GL_QUADS);
          glVertex3f(x - 0.5*size, y - 0.5*size, 0.0);
          glVertex3f(x + 0.5*size, y - 0.5*size, 0.0);
          glVertex3f(x + 0.5*size, y + 0.5*size, 0.0);
          glVertex3f(x - 0.5*size, y + 0.5*size, 0.0);
          glEnd();
        }
        */
      for (j = 0; j < agent_interface->size(); j++)
      {
        paint_agent(&(*agent_interface)[j]);
      }

      glutSwapBuffers();
  }
}


void CVisualisation::paint_agent(struct sAgentInterface *agent_interface)
{
  unsigned int i, j;

  unsigned int body_id = agent_interface->body_type;

  float x_ofs = agent_interface->position.x;
  float y_ofs = agent_interface->position.y;
  float z_ofs = agent_interface->position.z;

  float roll = agent_interface->position.roll;
  float pitch = agent_interface->position.pitch;
  float yaw = agent_interface->position.yaw;

  glPushMatrix();
//  glLoadIdentity();


  glTranslatef(x_ofs, y_ofs, z_ofs);

  glRotatef(roll, 0.0, 1.0, 0.0);
  glRotatef(pitch, 1.0, 0.0, 0.0);
  glRotatef(yaw, 0.0, 0.0, 1.0);


  if (agent_body[body_id]->vertices.size() != 0)
  {
    glColor3f(  1.0, 1.0, 1.0);

    //TODO speed test
    // glBufferData(GL_ARRAY_BUFFER, agent_body[body_id]->vertices.size() * sizeof(glm::vec3), &agent_body[body_id]->vertices[0], GL_STATIC_DRAW);

    glBegin(GL_TRIANGLES);
    for (j = 0; j < agent_body[body_id]->vertices.size(); j++)
    {
      glVertex3f(agent_body[body_id]->vertices[j].x, agent_body[body_id]->vertices[j].y, agent_body[body_id]->vertices[j].z);
    }
    glEnd();

  }
  else
  for (j = 0; j < agent_body[body_id]->body_polygons.size(); j++)
  {
    glColor3f(  agent_body[body_id]->body_polygons[j].r,
                agent_body[body_id]->body_polygons[j].g,
                agent_body[body_id]->body_polygons[j].b);

    glBegin(GL_POLYGON);

    for (i = 0; i < agent_body[body_id]->body_polygons[j].points.size(); i++)
    {
      glVertex3f( agent_body[body_id]->body_polygons[j].points[i].x,
                  agent_body[body_id]->body_polygons[j].points[i].y,
                  agent_body[body_id]->body_polygons[j].points[i].z);

                  /*
      printf("%f %f %f\n", agent_interface->body.polygons[j].points[i].x,
                              agent_interface->body.polygons[j].points[i].y,
                              agent_interface->body.polygons[j].points[i].z);
                              */
    }


    glEnd();
  }

  glPopMatrix();
}
