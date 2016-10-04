#ifndef _POINT_3D_H_
#define _POINT_3D_H_

#include <vector>

struct sPoint
{
  float x, y, z;
};

struct sPolygone
{
  std::vector<struct sPoint> points;
  float r, g, b;
};

struct sAgentPosition
{
  float x, y, z;
  float roll, pitch, yaw;
};


#endif
