#ifndef _VISUALISATION_AGENT_H_
#define _VISUALISATION_AGENT_H_

#include <string>
#include <vector>

#include "agent.h"
#include "config.h"


namespace ae
{
namespace agent
{


#ifdef BUILD_VISUALISATION

class VisualisationAgent : public Agent
{
  public:
    static const std::string kAgentTypeName;

  private:

    int m_framerate;

    std::vector<sAgentInterface> *m_agents;

    int m_window_handle;

    float m_cm_size;

  public:
    VisualisationAgent(int framerate = 0);
    ~VisualisationAgent();

    void process(Environment &env);

    uint16_t assigned_type() const { return config::agent_type_from_name(kAgentTypeName); }

    bool remove_protection() const { return true; }

  private:


};

#else

class VisualisationAgent : public Agent
{
  public:
    void process(Environment &env) { (void)env; }

    uint16_t assigned_type() const { return 0; }
};

#endif /* BUILD_VISUALISATION */


} /* namespace agent */
} /* namespace ae */



#endif /* _VISUALISATION_AGENT_H_ */
