#include "configure.h"

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

class CConfigure g_configure;

CConfigure::CConfigure()
{
  srand(time(NULL));

  FILE *f;
  f = fopen("../../configure.txt", "r");
  if (f == NULL)
  {
    printf("configure.txt file opening error\n");
    while (1) { }
  }

  fscanf(f, "%s %i\n", server_ip, &server_port);


  width_pixel = 800.0;
  height_pixel = 600.0;
  depth_pixel = 0.0;

  width_cm = 800.0/2.0;
  height_cm = 600.0/2.0;
  depth_cm = 300.0;

  cm_size = 10.0*100.0/81.0;

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
