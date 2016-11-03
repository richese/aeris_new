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

  int read_res = 0;

  read_res = fscanf(f, "%s %i\n", server_ip, &server_port);

  read_res = fscanf(f, "%s\n", server_unix_domain_path);

  //TODO
  //load from file : screen resolution, screen size (inch) and compute these values

  double screen_size = 1.0;
  depth_pixel = 0.0;

  //screen resolution in pixels, diagonal size in inches
  read_res = fscanf(f, "%lf %lf %lf\n", &width_pixel, &height_pixel, &screen_size);
  screen_size = screen_size*2.54;

/*
  //screen resolution in pixels
  width_pixel = 1920.0;
  height_pixel = 1080.0;

  //screen diagonal size in cm
  screen_size = 55.0*2.454;
*/

  //TODO
  width_cm =  16.0*sqrt( (screen_size*screen_size)/337.0 );
  height_cm =  9.0*sqrt( (screen_size*screen_size)/337.0 );

  cm_size = 0.5*width_pixel/(width_cm*1.0);

  printf("screen %f %f %f\n", width_cm, height_cm, cm_size);

  read_res = fscanf(f, "%u \n", &view_state);
  (void)read_res;
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

char *CConfigure::get_server_ud_path()
{
  return server_unix_domain_path;
}

char *CConfigure::get_server_ip()
{
  return server_ip;
}

int CConfigure::get_server_port()
{
  return server_port;
}

unsigned int CConfigure::get_view_state()
{
  return view_state;
}
