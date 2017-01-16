#include <cstdint>
#include <vector>

#include "agent.h"
#include "agent_body.h"
#include "timing.h"


ae::Agent::Agent()
{
  m_interface.id = 0;
  m_interface.type = 0;
  m_interface.body = 0;

  m_interface.timestamp = 0;
  m_interface.expires = 0;

  m_interface.position = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
  m_interface.color = {0.0f, 0.0f, 0.0f};

  m_interface.value[0] = 0;
  m_interface.value[1] = 0;
  m_interface.value[2] = 0;
  m_interface.value[3] = 0;
}


ae::Agent::~Agent()
{

}


void ae::Agent::init(uint64_t id)
{
  m_interface.id = id;
  m_interface.type = this->assigned_type();
  m_interface.body = AgentBody::get_body_type(this->assigned_type());
  m_interface.timestamp = time::timestamp();
  m_interface.expires = time::future_timestamp(time::seconds(3));
  m_interface.expires = 0;
}


ae::Environment::Environment(uint32_t group_id, std::vector<sAgentInterface> &global_state) :
  m_this_group_id(group_id),
  m_global_state(global_state),
  m_add_agents(),
  m_delete_agents()
{

}


ae::Environment::~Environment()
{
  // Nothing to do
  // m_add_agents pointers are handled by agent group.
}


const ae::AgentBody* ae::Environment::body_of_agent(const sAgentInterface &agent)
{
  return AgentBody::get_body(agent.body);
}
