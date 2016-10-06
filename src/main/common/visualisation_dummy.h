#ifndef _VISUALISATION_DUMMY_H_
#define _VISUALISATION_DUMMY_H_

#include "agents/agent_interface.h"

class CVisualisationDummy
{
  public:
    CVisualisationDummy();
    virtual ~CVisualisationDummy();
    virtual void refresh(std::vector<struct sAgentInterface> *agent_interface);

};



#endif
