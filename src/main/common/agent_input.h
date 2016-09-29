#ifndef _AGENT_INPUT_H_
#define _AGENT_INPUT_H_

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <vector>

#include <point3d.h>

struct sAgentInput
{
  struct sAgentPosition position;
  unsigned int agent_type, id;
  float distance;
};


class CAgentInput
{
  public:
    CAgentInput();
    ~CAgentInput();

    virtual void agent_set_input(std::vector<struct sAgentInput> *input);
};



#endif
