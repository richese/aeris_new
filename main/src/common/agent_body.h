#ifndef _AGENT_BODY_H_
#define _AGENT_BODY_H_

#include <cstdint>
#include <map>
#include <mutex>
#include <vector>

#include "logging.h"
#include "types.h"


namespace ae {


class AgentBody;


/** \brief Wrapper around AgentBody class to handle automatic destruction at
 *program end.
 *
 * \see ae::helpers::BodyStorage
 */
using AgentBodyPtr = std::shared_ptr<AgentBody>;


/** \brief Manages loading and storage of 3D agent bodies.
 *
 * Bodies are saved in obj format.
 *
 * Bodies are loaded based on configuration file.
 * It contains information about body name, interrface type, used model
 * and scale factor.
 *
 * Body configuration is located in *body_list* object which is located in root
 * object of  configuration file.
 * Each body is a named object for readibility.
 * A body object musit contain the following items:
 *  - *interface_type* (unsigned int).
 *    Unique identifier for this body type.
 *    This number is used to retreive agent model from this class and is used in
 *    agent interfaces which are send to server.
 *
 *  - *model* (string).
 *    Path to body model file in OBJ format.
 *    This has to be either an absolute path or path relative to MAIN_ROOT_DIR
 *    environment variable.
 *    If value is null instead of string no model will be loaded for this body.
 *
 *  - *scale* (float).
 *    All points in body model will be scaled by this factor at load time.
 *    1 unit in model file is equal to 1 cm in system.
 *
 * Example body definitions of bodies *sphere* and *no_body*:
 *
 *     {
 *       "body_list":
 *       {
 *         "sphere":
 *         {
 *           "interface_type": 1,
 *           "model": "models/sphere.obj",
 *           "scale": 0.5
 *         },
 *         "no_body":
 *         {
 *           "interface_type": 2,
 *           "model": null,
 *           "scale": 1.0
 *         }
 *       }
 *     }
 */
class AgentBody
{
public:
  /** \brief Retreive agent body from shared storage.
   *
   * Body will be loaded into memory at runtime during first request.
   *
   * \param body_id
   *
   *
   * \returns
   * Pointer to requested agent body.
   *
   * Nullptr if body with such id does not exist.
   */
  static const AgentBodyPtr getBody(const uint16_t body_id);

  /** \brief The same as above. */
  static const AgentBodyPtr getBody(const AgentInterface &agent);

  /** \brief Get body type assigned to specific agent type.
   *
   * \param agent_id
   * Type of agent.
   *
   * \returns
   * Type of body assigned to agents with given agent_id defined in *agent_list*.
   */
  static uint16_t getBodyType(const uint16_t agent_type);

private:
  /** \brief Loads agent body from OBJ model file */
  static AgentBody* loadBody(const uint16_t body_id);


private:
  /* \brief List of all vertices of this body.
   *
   * Vertices are ordered so that each triplet of vertices defines one triangle
   * of bodies model.
   * Elements [0], [1], [2] are the first triangle, elements [3], [4], [5] are
   * the second triangle, etc.
   */
  std::vector<Point3D> m_vertices;

public:
  ~AgentBody();

  /* \brief Get read-only reference to bodies vertices. */
  const std::vector<Point3D>& vertices() const { return m_vertices; }

private:
  AgentBody();

  /** \brief Simple OBJ model file parser. */
  int loadObj(const std::string &filename, const float scale);
};


namespace helpers {


/** \brief Shared storage for loaded robot bodies. */
using BodyStorage = SharedStorage<std::map<uint16_t, AgentBodyPtr>>;


} /* namespace helpers */

} /* namespace ae */


#endif /* _AGENT_BODY_H_ */
