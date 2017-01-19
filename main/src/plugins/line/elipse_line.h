#ifndef _ELIPSE_LINE_H_
#define _ELIPSE_LINE_H_

#include <cstdint>

#include <vector>

#include "common/agent.h"
#include "common/agent_body.h"
#include "common/config.h"

class ElipseLine : public ae::Agent
{
  public:
    static std::vector<ae::Agent*>* spawn_line(const nlohmann::json &parameters);

  private:
    ae::Point2D m_initial_position;
    float m_speed;
    float m_phase;

  public:
    ElipseLine(int index, int agent_count, float radius, float speed, const ae::sColor &color);
    ~ElipseLine() {}

    void process(ae::Environment &env);

    uint16_t assigned_type() const;

    bool remove_protection() const { return false; }

  private:
    void set_position();
};


#endif /* _ELIPSE_LINE_H_ */
