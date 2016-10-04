#ifndef _POINT_3D_H_
#define _POINT_3D_H_

#include <vector>

struct sPoint
{
  float x, y, z;

  template<typename Archive>
  void serialize(Archive& ar, const unsigned version)
  {
    ar & x & y & z;
    (void)version;
  }
};

struct sPolygone
{
  std::vector<struct sPoint> points;
  float r, g, b;

  template<typename Archive>
  void serialize(Archive& ar, const unsigned version)
  {
    unsigned int i;
    for (i = 0; i < points.size(); i++)
      ar & points[i];
    ar & r & g & b;
    (void)version;
  }
};


struct sAgentBody
{
  std::vector<struct sPolygone> polygons;

  template<typename Archive>
  void serialize(Archive& ar, const unsigned version)
  {
    unsigned int i;
    for (i = 0; i < polygons.size(); i++)
      ar & polygons[i];
    (void)version;
  }
};

struct sAgentPosition
{
  float x, y, z;
  float roll, pitch, yaw;

  template<typename Archive>
  void serialize(Archive& ar, const unsigned version)
  {
    ar & x & y & z;
    ar & roll & pitch & yaw;
    (void)version;
  }
};


#endif
