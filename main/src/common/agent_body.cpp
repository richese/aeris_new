#include <vector>
#include <map>
#include <mutex>

#include "agent.h"
#include "agent_body.h"


namespace ae
{

AgentBodyStorage *storage = new AgentBodyStorage();

} /* namespace ae */


const ae::AgentBody* ae::AgentBody::get_body(const uint16_t body_id)
{
  return nullptr;
}

const ae::AgentBody* ae::AgentBody::get_body(const sAgentInterface &agent)
{
  return get_body(agent.body);
}

uint16_t ae::AgentBody::get_body_type(const uint16_t agent_type)
{
  return 0;
}


ae::AgentBody::AgentBody() :
  m_vertices()
{

}


ae::AgentBody::~AgentBody()
{

}


int ae::AgentBody::load_obj(const std::string &filename, const float scale)
{
  return 0;
}


ae::AgentBodyStorage* ae::AgentBodyStorage::get_storage()
{
  return storage;
}


void ae::AgentBodyStorage::set_storage(ae::AgentBodyStorage *body_storage)
{
  if (body_storage == nullptr)
  {
    return;
  }

  if (storage != nullptr)
  {
    delete storage;
  }

  storage = body_storage;
}


ae::AgentBodyStorage::AgentBodyStorage() :
  lock(),
  bodies()
{

}


ae::AgentBodyStorage::~AgentBodyStorage()
{
  lock.lock();
  for (auto &body : bodies)
  {
    if (body.second != nullptr)
    {
      delete body.second;
      body.second = nullptr;
    }
  }
  lock.unlock();
}
