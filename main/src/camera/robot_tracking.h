#ifndef _ROBOT_TRACKING_
#define _ROBOT_TRACKING_

#include <cstdint>

#include <string>

#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>

#include "common/config.h"

#include "segmentation.h"
#include "detector.h"
#include "tracking.h"


namespace ae {

/** \brief Namespace containing all functionality of robot tracking.
 *
 */
namespace tracking {


/** \addtogroup robot-tracking
 * @{
 */


/** \brief Main application for robot tracking algorithms.
 *
 */
class RobotTracking
{
public:

  /** \brief Additional debug information drawing flags. */
  enum DebugFlags
  {
    /** \brief Completely disables all GUI visualisation & debug elements. */
    DEBUG_ENABLE     = 0x0001,

    /** \brief Whether separate window with binary foreground mask is being
     * drawn.
     */
    DEBUG_FG_MASK    = 0x0002,

    /** \brief Whether separate window with colored foreground image is being
     * drawn.
     */
    DEBUG_FG_IMAGE   = 0x0004,

    /** \brief Enables drawing of FAST keypoints in main visualisation window.
     *
     * Keypoints are drawn as randomly colored circles.
     * Total amount of detected keypoints is shown in bottom left corner as
     * `K: count `.
     */
    DEBUG_KEYPOINTS  = 0x0008,

    /** \brief Enables drawing of centroids in main visualisation window.
     *
     * Centroids are drawn as bright green dots or red dots for discarded
     * centroids.
     * Each centroid has value of its response shown next to it.
     * Total count of centroids is shown in bottom left corner as `C: count`.
     */
    DEBUG_CENTROIDS  = 0x0010,

    /** \brief Enables drawing of positive detections in main visualisation
     * window.
     *
     * Detections are shown as green rectangles.
     * Total count of detections is shown in bottom left corner as `D: count`.
     */
    DEBUG_DETECTIONS = 0x0020,

    /** \brief Enables drawing of track history.
     *
     * Tracks are displayed as randomly colored lines that trail after robots.
     */
    DEBUG_TRACKS     = 0x0040,

    /** \brief Turns on saving of regions of interest into working directory.
     *
     * Roi are 40x40 px areas around all valid centroids.
     * Saved images are grayscale png images.
     */
    DEBUG_SAVE_ROI   = 0x0080
  };

  /** \brief Name of debugging window created by OpenCV.
   *
   * Also acts as identifier of this window in OpenCV.
   */
  static const std::string kDebugWindow;

  /** \brief Resolution of used video frames.
   *
   * All video sources will be resized to this resolution.
   */
  static const cv::Size kStreamResolution;

  /** \brief Constructor to configure the whole application from configuration
   * file.
   *
   * \param settings
   * JSON object named "robot_tracking" taken from root object of configuration
   * file.
   *
   * For more information about configurable parameters see:
   * \see RobotTracking::loadConfiguration
   */
  RobotTracking(nlohmann::json settings = nlohmann::json::object());

  /** \brief Main loop of robot tracking application.
   *
   * Program can be shut down by pressing ESC or sending SIGTERM signal to
   * process.
   */
  void run();

private:
  /** \brief Configures all parts of robot tracking application.
   *
   * Configuration is stored in JSON object named "robot_tracking" which should
   * be located in root object of Aeris configuration file.
   *
   * Following settings are configurable through this object:
   *  - *debug* (boolean).
   *    Enables debug visualisation window drawn by OpenCV.
   *    Disabling debug window can increase performance if there is no need to
   *    tweak settings at runtime.
   *
   *  - *framerate* (unsigned int).
   *    Determines how many frames per second are read from video source.
   *
   *  - *stream* (unsigned int).
   *    Selects web camera as video source.
   *    Number represents camera id in system. Ids start at 0 and increment for
   *    each additional camera.
   *    0 usually belongs to integrated web cameras in laptops.
   *
   *    Example that select second camera present on system:
   *
   *        {
   *           "stream": 1
   *        }
   *
   *  - *stream* (string).
   *    Selects video file as video source.
   *    Supported formats depend on OpenCV.
   *    String is either an absolute path to viedo file or relative to
   *    MAIN_ROOT_DIR environment variable.
   *
   *    Example with absolute path:
   *
   *        {
   *           "stream": "/home/user/aeris_new/main/data/recording_640x360_01.mkv"
   *        }
   *
   *    The same example with relative path:
   *
   *        {
   *           "stream": "data/recording_640x360_01.mkv"
   *        }
   *
   *    In this case MAIN_ROOT_DIR is equal to _/home/user/aeris_new/main/_
   *
   *  - *playground_corners* (array).
   *    Array of four points that mark the edges of playground in input frames.
   *
   *    This setting is automatically copied to *segmentation* object if it has
   *    no playground_corners defined.
   *
   *    Example:
   *
   *        {
   *          "playground_corners": [[71, 13], [617, 28], [605, 338], [65, 312]],
   *          "segmentation":
   *          {
   *             "no need for playground_corners here": 0
   *          }
   *        }
   *
   *  - *segmentation* (object).
   *    Parameters for segmentation part of detection chain.
   *    Available parameters are described in Segmentation::loadConfiguration.
   *
   *  - *detector* (object).
   *    Parameters for detection part of detection chain.
   *    Available parameters are described in Detector::loadConfiguration.
   *
   *  - *tracking* (object).
   *    Parameters for tracking part of detection chain.
   *    Available parameters are described in Tracking::loadConfiguration.
   *
   * \param settings
   * JSON object.
   *
   * \see Segmentation::loadConfiguration
   * \see Detector::loadConfiguration
   * \see Tracking::loadConfiguration
   */
  void loadConfiguration(nlohmann::json &settings);

  /** \brief Allows to select edges of robot playground.
   *
   * Selected edges are used to transform robot coordinates from position in
   * image in pixels to position in system in centimeters.
   * Edges are also used to create playground detection mask that limits the
   * searched area.
   *
   * How to select playground corners:
   *   1. New window named "Select corners" will open.
   *   2. Left clicking places new corner.
   *   3. Right clicking removes all placed corners.
   *   4. Enter 4 corners in the following order:
   *     - Top left corner
   *     - Top right corner
   *     - Bottom right corner
   *     - Bottom left corner
   *   5. When 4 corners are selected press ESC or Return to confirm your
   *   selection.
   *
   * \param frame
   * Video which will be used to select playground edges.
   *
   * \returns
   * Array with position of 4 selected corners.
   */
  std::vector<cv::Point> selectPlayground(const cv::Mat &frame);

private:

  /** \brief Debug drawing flags.
   *
   * \see RobotTracking::DebugFlags
   */
  uint16_t m_debug;

  /** \brief Stores loaded setting about desired video framerate. */
  uint16_t m_framerate;

  /** \brief OpenCV wrapper around video stream from web cam or file. */
  cv::VideoCapture m_video_stream;

  Segmentation m_segmentation;
  Detector m_detector;
  Tracking m_tracking;
};


/** @} */


} // namespace tracking

} //namespace ae


#endif /* _ROBOT_TRACKING_ */
