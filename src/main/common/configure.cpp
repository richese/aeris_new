#include "configure.h"
#include "unique_id.h"

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>

class CConfigure g_configure;

CConfigure::CConfigure()
{
  srand(time(NULL) + get_unique_id());

  FILE *f;
  f = fopen("../../configure.txt", "r");
  if (f == NULL)
  {
    printf("configure.txt file opening error\n");
    while (1) { }
  }

  int res = fscanf(f, "%s %i\n", server_ip, &server_port);

  //TODO
  //load from file : screen resolution, screen size (inch) and compute these values

  float screen_size = 1.0;
  depth_pixel = 0.0;


/*
  width_pixel = 800.0;
  height_pixel = width_pixel*9.0/16.0;
  screen_size = 22.0;
  cm_size = 1.0/10.0;
*/

  width_pixel = 1920.0;
  height_pixel = 1080.0;
  screen_size = 55.0*2.454;
  cm_size = 1/4.8;


  width_cm =  16.0*sqrt( (screen_size*screen_size)/337.0 )*0.5;
  height_cm =  9.0*sqrt( (screen_size*screen_size)/337.0 )*0.5;
  cm_size*= width_pixel/(width_cm*1.0);

  (void)res;

/*
  sprintf(server_ip,"127.0.0.1");
  server_port = 2010;
*/

}

CConfigure::~CConfigure()
{


}

double CConfigure::get_width_pixel()
{
  return width_pixel;
}

double CConfigure::get_height_pixel()
{
  return height_pixel;
}

double CConfigure::get_depth_pixel()
{
  return depth_pixel;
}

double CConfigure::get_width_cm()
{
  return width_cm;
}

double CConfigure::get_height_cm()
{
  return height_cm;
}

double CConfigure::get_depth_cm()
{
  return depth_cm;
}

double CConfigure::get_cm_size()
{
  return cm_size;
}

char *CConfigure::get_server_ip()
{
  return server_ip;
}

int CConfigure::get_server_port()
{
  return server_port;
}
