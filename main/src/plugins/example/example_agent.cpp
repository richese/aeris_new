#include "common/agent.h"  // pre ae::Agent, ae::Environment
#include "common/agent_body.h"  // pre ae::AgentBody
#include "common/config.h"  // pre ae::config::get
#include "common/timing.h" // pre ae::time::sleep_for, ae::time::milliseconds
#include "common/logging.h" // pre LOG()

#include "example_agent.h"


ExampleAgent::ExampleAgent(const nlohmann::json &parameters) :
  Agent()
{
  m_interface.timestamp = ae::time::timestamp();
  m_interface.expires = ae::time::future_timestamp(ae::time::seconds(2));

  m_interface.position = { 0, 0, 0, 0, 0, 0};
  float size_x = ae::config::get["playground"]["size"][0].get<float>();
  float size_y = ae::config::get["playground"]["size"][1].get<float>();

  m_interface.position.x = (float)(rand() % (int)(size_x * 100)) / 100 - (size_x / 2);
  m_interface.position.y = (float)(rand() % (int)(size_y * 100)) / 100 - (size_y / 2);

  m_interface.color = {1.0f, 0.0f, 0.0f};

  m_interface.value[0] = 0;
  m_interface.value[1] = 1;
  m_interface.value[2] = 2;
  m_interface.value[3] = 3;

  m_dx = 0.0;
  m_dy = 0.0;

  if (parameters.is_object())
  {
    if (parameters.find("color") != parameters.end() &&
        parameters["color"].is_array() &&
        parameters["color"].size() == 3)
      {
        m_interface.color.r = parameters["color"][0];
        m_interface.color.g = parameters["color"][1];
        m_interface.color.b = parameters["color"][2];
        VLOG(3) << "Color set to " << parameters["color"];
      }
  }
}

/** \brief Napíše do logu, že  bola zavolaná táto funkcia a čaká 5 ms. */
void ExampleAgent::process(ae::Environment &env)
{
  (void)env;

  m_interface.timestamp = ae::time::timestamp();
  m_interface.expires = ae::time::future_timestamp(ae::time::seconds(2));

  if (rand() % 100 == 0)
  {
    m_dx = ((float)(rand() % 64) - 32) / 512;
    m_dy = ((float)(rand() % 64) - 32) / 512;
  }

  m_interface.position.x += m_dx;
  m_interface.position.y += m_dy;

  float size_x = ae::config::get["playground"]["size"][0].get<float>();
  float size_y = ae::config::get["playground"]["size"][1].get<float>();

  if (m_interface.position.x < (-size_x/2))
    m_interface.position.x = (-size_x/2);

  if (m_interface.position.x > (size_x/2))
    m_interface.position.x = (size_x/2);

  if (m_interface.position.y < (-size_y/2))
    m_interface.position.y = (-size_y/2);

  if (m_interface.position.y > (size_y/2))
    m_interface.position.y = (size_y/2);
}


uint16_t ExampleAgent::assigned_type() const
{
  // plugin.cpp chcecks that this config entry exists
  return ae::config::get["agent_list"]["example_agent"]["interface_type"];
}
