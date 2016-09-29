#include "agent_output.h"
#include "debug.h"

CAgentOutput::CAgentOutput()
{
  output.position.x = 0.0;
  output.position.y = 0.0;
  output.position.z = 0.0;

  output.position.roll = 0.0;
  output.position.pitch = 0.0;
  output.position.yaw = 0.0;

  output.agent_type = 0;
  output.id = 0;

  #ifdef _DEBUG_COMMON_
  printf("%lu : agent output created\n", (unsigned long int)this);
  #endif
}

CAgentOutput::~CAgentOutput()
{

}


struct sAgentOutput* CAgentOutput::get_output()
{
  return &output;
}


struct sAgentPolygons* CAgentOutput::get_polygons()
{
  return &polygons;
}


void CAgentOutput::init_body()
{
  #ifdef _DEBUG_COMMON_
  printf("%lu : output init body called\n", (unsigned long int)this);
  #endif
}
