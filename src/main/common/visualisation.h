#ifndef _VISUALISATION_H_
#define _VISUALISATION_H_

#include <agent_interface.h>

class CVisualisation
{
  private:
    bool opengl_enabled;
    float cm_size;

    std::vector<class CAgentBody*> agent_body;

  public:
    CVisualisation();
    ~CVisualisation();


    void refresh(std::vector<struct sAgentInterface> *agent_interface);

  private:
    void paint_agent(struct sAgentInterface *agent_interface);

};


#endif
