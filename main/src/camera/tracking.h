#ifndef _TRACKING_H_
#define _TRACKING_H_

#include <cstdint>

#include <vector>

#include <opencv2/core.hpp>

#include "common/agent.h"
#include "common/agent_client.h"
#include "common/config.h"


namespace ae {

namespace tracking {


/** \addtogroup robot-tracking
 * @{
 */


/** \brief Represents path traversed by one robot.
 *
 * Path uniquely represents one robot in agent environment.
 * Path contains information about current robot position, prediction of robot
 * movement, number of past positions that robot traveled through, how long was
 * it detected, etc.
 *
 */
class Path
{
public:
  /** \brief Initializes Path with new robot detection.
   *
   * \param position
   * Current position of newly detected robot.
   *
   * \param id
   * Unique id that will be uset in agent interface.
   *
   * \param type
   * Agent type assigned to agents of real robots.
   *
   * \param path_length
   * How long should position history be.
   *
   * \param path_sample_avg
   * How many points will be averaged to create new position.
   * This involves the new position and up to path_sample_avg positions from
   * position history.
   */
  Path(cv::Point position, uint64_t id, uint16_t type, uint32_t path_length, uint32_t path_sample_avg);

  /** \brief Update path with new robot position and generate prediction for
   * next frame.
   *
   * \param pos
   * New robot position that should be added to path.
   *
   * \param is_miss
   * If true robot position is updated but is counted as missed detection.
   * New position in this case is most likely prediction fro mprevious update.
   */
  void update_position(const cv::Point2f pos, bool is_miss = false);

  /** \brief Getter for current robot position. */
  cv::Point2f position() const;

public:
  /** \brief Color of this track that is drawn in debug window and is also set
   * as agent color in interface.
   * Color is randomly generated at Path creation.
   */
  cv::Scalar color;

  /** \brief Prediction of robot position in next frame. */
  cv::Point2f prediction;

  /** \brief How many times was this path updated. */
  uint32_t seen_for;

  /** \brief How many frames was this path updated without proper robot
   * detection just based on predicted position.
   */
  uint32_t miss_count;

  /** \brief Complete list of up to m_path_length past robot positions.
   *
   * Newest position is located at the end of array.
   */
  std::vector<cv::Point2f> history;

  /** \brief Agent interface that is send to Aeris agent server. */
  ae::sAgentInterface interface;

private:
  /** \brief Maximum length of past robot positions. */
  uint32_t m_path_length;

  /** \brief How many positions are averaged when new position is added. */
  uint32_t m_path_sample_avg;
};


/** \brief Class tasked with managment of Paths, association of detections
 * and sending data to Aeris server.
 *
 * It creates, updates and deletes Paths each frame based on received robot
 * detections.
 *
 *
 */
class Tracking
{
public:
  /** \brief Default number of samples that are being kept in path history. */
  static const uint32_t kDefaultPathLength = 100;

  /** \brief How many samples are by default averaged to create new sample. */
  static const uint32_t kDefaultPathSampleAvg = 3;

  /** \brief Max distance between detection and Path end for successfull
   * asociation.
   */
  static constexpr float kDefaultMatchDist = 30.0f;

  /** \brief Path will be removed after this many continuous failed detection
   * associations.
   */
  static const uint32_t kDefaultPathRemoveLimit = 50;

  /** \brief Path will be send to system only if it had at least this many
   * successful associations.
   */
  static const uint32_t kDefaultPathValidLimit = 55;

  /** \brief Initializes Tracking with default values. */
  Tracking();

  ~Tracking() {}

  /** \brief Loads settings from given JSON object.
   *
   *
   * Available settings:
   *  - *path_length* (unsigned int).
   *    How long should the history of past robot positons be.
   *    This value is mainly for debugging and visualisation.
   *    It should be greater than path_sample_avg.
   *
   *  - *path_sample_avg* (unsigned int).
   *    Smoothes robot positions by averaging new detections with a number of
   *    past positions.
   *
   *  - *match_dist* (float).
   *    Maximum asociation distance.
   *    Only detections whose distance to robot position prediction is smaller
   *    than this value will be considered when updating Path position.
   *
   *  - *path_remove_limit* (unsigned int).
   *    If a path was not updated with new detecion for this many continuous
   *    frames it will be deleted.
   *
   *  - *path_valid_limit* (unsigned int).
   *    The required number of valid asociations before a Path is send to Aeris
   *    server.
   *
   *  - *agent_type* (string).
   *    The name of agent type that will be used to select agent interface type
   *    & body ids.
   *
   *    Config example:
   *
   *        {
   *          "robot_tracking":
   *          {
   *            "tracking":
   *            {
   *              "agent_type": "real_robot_agent"
   *            }
   *          },
   *          "agent_list":
   *          {
   *            "real_robot_agent":
   *            {
   *              "interface_type": 1,
   *              "body": "null"
   *            }
   *          },
   *
   *          ...
   *
   *        }
   *
   *  - *playground_corners* (array).
   *    Array of four points that mark the edges of playground in input frames.
   *
   *    This is used to calculate transformation matrix between positions in
   *    video frames and coordinates used by system.
   *
   *    This setting is forwarded by application from "robot_tracking" object if
   *    not present.
   *
   *    Example:
   *
   *        {
   *          "playground_corners": [[71, 13], [617, 28], [605, 338], [65, 312]]
   *        }
   *
   * \see RobotTracking::loadConfiguration
   */
  void loadConfiguration(const nlohmann::json &settings);

  /** \brief Try to connect to Aeris server.
   *
   * Server is selected from configuration file.
   * If connection fails robot positions won't be send to system.
   */
  void connectToAeris();

  /** \brief Creates transformation matrix to convert pixel position to cm
   * position.
   *
   * \param frame_corners
   * Array of four playground corners.
   *
   * \see RobotTracking::selectPlayground
   * \see loadConfiguration
   */
  void setPerspTransform(const std::vector<cv::Point2f> &frame_corners);

  /** \brief Does the same as above. This is here just for convinience. */
  void setPerspTransform(const std::vector<cv::Point> &frame_corners);

  /** \brief Convert pixel position from frame to real offset used by system.
   *
   * \param frame_pos
   * Pixel position of robot in video frame.
   *
   * \returns
   * Real system position based on playground size and playground corners.
   */
  cv::Point2f getRealPosition(const cv::Point2f &frame_pos);

  /** \brief
   *
   *
   *
   *
   */
  void update(const std::vector<cv::Point> &positions);

  /** \brief Provides access all currently existing tracks. */
  const std::vector<Path>& tracks() const { return m_tracks; }

  /** \brief Getter for currently used path history length. */
  uint32_t getPathLength() const { return m_path_length; }

private:
  /** \see loadConfiguration */
  uint32_t m_path_length;

  /** \see loadConfiguration */
  uint32_t m_path_sample_avg;

  /** \see loadConfiguration */
  float m_match_dist;

  /** \see loadConfiguration */
  uint32_t m_path_remove_limit;

  /** \see loadConfiguration */
  uint32_t m_path_valid_limit;

  /** \brief Perspective transform used to convert robot positions.
   * \see loadConfiguration
   */
  cv::Mat m_persp_transform;

  /** \brief List of all existing tracks. */
  std::vector<Path> m_tracks;

  /** \brief Interface id used by path agents send to the system. */
  uint16_t m_agent_type;

  /** \brief Client communication interface provided by Aeris. */
  ae::Client m_aeris_client;

  /** \brief Agent group id received from Aeris server for path agents. */
  uint32_t m_agent_group_id;

  /** \brief Counter of created tracks.
   *
   * Used to generate unique id for path agents.
   */
  uint32_t m_track_counter;

  /** \brief Whether connection to server was successfull and path data can be
   * send to server.
   */
  bool m_online;
};


/** @} */


} // namespace tracking

} // namespace ae


#endif /* _TRACKING_H_ */
