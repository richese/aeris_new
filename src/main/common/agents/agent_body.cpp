#include "agent_body.h"
#include "../math_robot.h"
#include <stdio.h>
#include <string>
#include <string.h>

CAgentBody::CAgentBody()
{

}

CAgentBody::CAgentBody(unsigned int body_type)
{
  rand_value = 0;
  switch(body_type)
  {
    case AGENT_BODY_TYPE_NULL: agent_body_null(); break;
    case AGENT_BODY_TYPE_SQUARE: agent_body_square(); break;
    case AGENT_BODY_TYPE_RANDOM: agent_body_random(); break;
    case AGENT_BODY_TYPE_CUSTOM:  obj_load((char*)"../../../models/demo.obj"); break;
  }
}

CAgentBody::~CAgentBody()
{

}

void CAgentBody::agent_body_null()
{

}

void CAgentBody::agent_body_square()
{

}


void CAgentBody::agent_body_random()
{
  unsigned int j, i;

  float size = 5.0*m_abs(agent_body_rnd());

  unsigned polygons_count = 10;

  for (j = 0; j < polygons_count; j++)
  {
    struct sPolygone polygone;
    for (i = 0; i < 4; i++)
    {
      struct sPoint point;

      point.x = agent_body_rnd()*size;
      point.y = agent_body_rnd()*size;
      point.z = agent_body_rnd()*size;
      polygone.points.push_back(point);
    }

    polygone.r = m_abs(agent_body_rnd());
    polygone.g = m_abs(agent_body_rnd());
    polygone.b = m_abs(agent_body_rnd());


    body_polygons.push_back(polygone);
  }
}

void CAgentBody::obj_load(char* body_filename)
{
  load_from_file(body_filename);
}


bool CAgentBody::load_from_file(char * path)
{

  std::vector< unsigned int > vertexIndices, uvIndices, normalIndices;
  std::vector< struct sPoint > temp_vertices;
  std::vector< struct sPoint2D > temp_uvs;
  std::vector< struct sPoint > temp_normals;


  FILE * file = fopen(path, "r");
  if( file == NULL ){
      printf("Impossible to open the file !\n");
      return false;
  }

  int res_dummy;

  while( 1 )
  {

      char lineHeader[128];
      // read the first word of the line
      int res = fscanf(file, "%s", lineHeader);
      if (res == EOF)
          break; // EOF = End Of File. Quit the loop.

      // else : parse lineHeader

      if ( strcmp( lineHeader, "v" ) == 0 )
      {
          struct sPoint vertex;
          res_dummy = fscanf(file, "%f %f %f\n", &vertex.x, &vertex.y, &vertex.z );

          float k = 0.9999;
          vertex.x*= k;
          vertex.y*= k;
          vertex.z*= k;
          temp_vertices.push_back(vertex);
      }
      else if ( strcmp( lineHeader, "vt" ) == 0 )
      {
            struct sPoint2D uv;
            res_dummy = fscanf(file, "%f %f\n", &uv.x, &uv.y );
            temp_uvs.push_back(uv);
      }
      else if ( strcmp( lineHeader, "vn" ) == 0 )
      {
            struct sPoint normal;
            res_dummy = fscanf(file, "%f %f %f\n", &normal.x, &normal.y, &normal.z );
            temp_normals.push_back(normal);
      }
      else if ( strcmp( lineHeader, "f" ) == 0 )
      {
              std::string vertex1, vertex2, vertex3;

              unsigned int vertexIndex[3], uvIndex[3], normalIndex[3];

              uvIndex[0] = 0;
              uvIndex[1] = 0;
              uvIndex[2] = 0;
              // int matches = fscanf(file, "%u/%u/%u %u/%u/%u %u/%u/%u\n", &vertexIndex[0], &uvIndex[0], &normalIndex[0], &vertexIndex[1], &uvIndex[1], &normalIndex[1], &vertexIndex[2], &uvIndex[2], &normalIndex[2] );

              int matches = fscanf( file, "%u//%u %u//%u %u//%u\n",

                                    &vertexIndex[0],
                                  //  &uvIndex[0],
                                    &normalIndex[0],

                                    &vertexIndex[1],
                                  //  &uvIndex[1],
                                    &normalIndex[1],

                                    &vertexIndex[2],
                                  //  &uvIndex[2],
                                    &normalIndex[2] );

              if (matches != 6)
              {
                  printf("File can't be read by our simple parser : ( Try exporting with other options\n");
                  return false;
              }

              /*

              printf("%u//%u %u//%u %u//%u\n",

                                    vertexIndex[0],
                                  //  uvIndex[0],
                                    normalIndex[0],

                                    vertexIndex[1],
                                  //  uvIndex[1],
                                    normalIndex[1],

                                    vertexIndex[2],
                                  //  uvIndex[2],
                                    normalIndex[2] );

              */
              vertexIndices.push_back(vertexIndex[0]);
              vertexIndices.push_back(vertexIndex[1]);
              vertexIndices.push_back(vertexIndex[2]);
              uvIndices    .push_back(uvIndex[0]);
              uvIndices    .push_back(uvIndex[1]);
              uvIndices    .push_back(uvIndex[2]);
              normalIndices.push_back(normalIndex[0]);
              normalIndices.push_back(normalIndex[1]);
              normalIndices.push_back(normalIndex[2]);
      }

  }


  // For each vertex of each triangle
  for( unsigned int i=0; i<vertexIndices.size(); i++ )
  {
      unsigned int vertexIndex = vertexIndices[i];
      struct sPoint vertex = temp_vertices[ vertexIndex-1 ];
      vertices.push_back(vertex);
  }

  (void)res_dummy;




  return false;
}








unsigned int CAgentBody::agent_body_rand()
{
  rand_value = rand_value *(unsigned int)1103515245 + (unsigned int)12345;
  return rand_value;
}

double CAgentBody::agent_body_rnd()
{
  return (agent_body_rand()%200000000)/100000000.0 - 1.0;
}
