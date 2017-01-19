#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include <cstdint>
#include <map>
#include <mutex>
#include <vector>

#include "logging.h"


namespace ae
{


/* Forward declaration. Defined in agent.h */
struct sAgentInterface;


struct Point2D
{
  float x, y;
};


struct Point3D
{
  float x, y, z;
};


class AgentBody
{
  public:
    /** Vrati objekt tela agenta ak poznáme interface id tohto tela. */
    static const AgentBody* get_body(const uint16_t body_id);
    static const AgentBody* get_body(const sAgentInterface &agent);

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


/* Pomocne triedy a funkcie tykajuce sa memory managmentu nacitanych tiel */
namespace helpers
{


typedef std::map<uint16_t, AgentBody*> body_map_t;

class body_storage_t
{
  public:
    body_map_t bodies;
    std::mutex lock;

    body_storage_t() : bodies(), lock() {}
};

body_storage_t* get_body_storage();
void set_body_storage(body_storage_t *storage);


} /* namespace helpers */


} /* namespace ae */


#endif /* _AGENT_BODY_H_ */
