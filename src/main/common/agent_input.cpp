#include "agent_input.h"
#include "debug.h"

CAgentInput::CAgentInput()
{
  

  #ifdef _DEBUG_COMMON_
  printf("%lu : agent input created\n", (unsigned long int)this);
  #endif
}

CAgentInput::~CAgentInput()
{

}

void CAgentInput::agent_set_input(std::vector<struct sAgentInput> *input)
{
  (void)input;
}
