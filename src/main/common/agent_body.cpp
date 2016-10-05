#include <agent_body.h>
#include <math_robot.h>
#include <stdio.h>
#include <string.h>

CAgentBody::CAgentBody(unsigned int body_type)
{
  rand_value = 0;
  switch(body_type)
  {
    case AGENT_BODY_TYPE_NULL: agent_body_null(); break;
    case AGENT_BODY_TYPE_SQUARE: agent_body_square(); break;
    case AGENT_BODY_TYPE_RANDOM: agent_body_random(); break;
  }
}

CAgentBody::CAgentBody(char* body_filename)
{
  struct sPolygone triangle;
  struct sPoint point_temp;
  std::vector<struct sPoint> raw_data;
  point_temp.x = 0;
  point_temp.y = 0;
  point_temp.z = 0;
  triangle.r = 1;
  triangle.g = 1;
  triangle.b = 1;

  for (unsigned int i = 0; i < 3; i++)
  {
    triangle.points.push_back(point_temp);
  }

  FILE * file = fopen(body_filename, "r");
    if( file == NULL ){
      printf("Impossible to open the file !\n");
    }

  while(1)
  {
   char lineHeader[128];
    // read the first word of the line
   int res = fscanf(file, "%s", lineHeader);
   if (res == EOF)
     break; // EOF = End Of File. Quit the loop.
     // else : parse lineHeader

   if ( strcmp( lineHeader, "v" ) == 0 )
   {
    struct sPoint point;
    res = fscanf(file, "%f %f %f\n", &point.x, &point.y, &point.z );
    raw_data.push_back(point);
   }
  }

  fclose(file);

  for (unsigned int i = 0; i < (raw_data.size()-3); i++)
  {
    for (unsigned int j = i; j < (i+3); j++)
    {
      triangle.points[j-i] = raw_data[j];
    }
    body_polygons.push_back(triangle);
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

unsigned int CAgentBody::agent_body_rand()
{
  rand_value = rand_value *(unsigned int)1103515245 + (unsigned int)12345;
  return rand_value;
}

double CAgentBody::agent_body_rnd()
{
  return (agent_body_rand()%200000000)/100000000.0 - 1.0;
}
