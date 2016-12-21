#ifndef _ABSTRACT_AGENT_H_
#define _ABSTRACT_AGENT_H_

#include <stdlib.h>
#include "agent_interface.h"

template <class C_AGENT_TYPE> class tAbstractAgent
{
  public:
    tAbstractAgent()
    {

    }

    ~tAbstractAgent()
    {

    }

    C_AGENT_TYPE* create(  struct sAgentInterface agent_interface,
                           class CAgentGroup *agent_group = NULL,
                           unsigned long int group_id = 0)
    {
        return new C_AGENT_TYPE(agent_interface, agent_group, group_id);
    }

};

#endif
