#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include <cstdint>
#include <map>
#include <mutex>
#include <vector>


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
    static const AgentBody* get_body(const uint16_t body_id);
    static const AgentBody* get_body(const sAgentInterface &agent);

    static uint16_t get_body_type(const uint16_t agent_type);

  private:

  private:
    static std::map<uint16_t, AgentBody> loaded_bodies;

    static std::mutex lock_loaded_bodies;

    std::vector<Point3D> m_vertices;

  public:
    ~AgentBody();

    const std::vector<Point3D>& vertices() const { return m_vertices; }

  private:
    AgentBody();

    int load_obj(const std::string &filename, const float scale);
};


struct AgentBodyStorage
{
  static AgentBodyStorage* get_storage();
  static void set_storage(AgentBodyStorage *body_storage);

  std::mutex lock;
  std::map<uint16_t, AgentBody*> bodies;

  AgentBodyStorage();
  ~AgentBodyStorage();
};


} /* namespace ae */


#endif /* _AGENT_BODY_H_ */
