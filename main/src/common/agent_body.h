#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include <cstdint>
#include <map>
#include <mutex>
#include <vector>

#include "logging.h"
#include "types.h"


namespace ae
{


class AgentBody
{
  public:
    /** Vrati objekt tela agenta ak poznáme interface id tohto tela. */
    static const AgentBody* get_body(const uint16_t body_id);
    static const AgentBody* get_body(const AgentInterface &agent);

    /** Zisti aky typ tela prislucha agentovi s typom agent_type. */
    static uint16_t get_body_type(const uint16_t agent_type);

  private:
    static AgentBody* load_body(const uint16_t body_id);


  private:
    std::vector<Point3D> m_vertices;

  public:
    ~AgentBody();

    const std::vector<Point3D>& vertices() const { return m_vertices; }

  private:
    AgentBody();

    int load_obj(const std::string &filename, const float scale);
};


/** \brief Contains internal objects that manage shared resources between
 * application and plugins.
 */
namespace helpers
{


class BodyStorage
{
private:
  static BodyStorage local_storage;
  static BodyStorage *active_storage;

public:
  static BodyStorage* get() { return active_storage; }
  static void set(BodyStorage* storage);

public:
  std::map<uint16_t, AgentBody*> bodies;
  std::mutex lock;

  BodyStorage() : bodies(), lock() {}
};


} /* namespace helpers */


} /* namespace ae */


#endif /* _AGENT_BODY_H_ */
