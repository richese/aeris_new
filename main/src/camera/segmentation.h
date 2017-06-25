#ifndef _SEGMENTATION_H_
#define _SEGMENTATION_H_

#include <cstdint>

#include <string>
#include <vector>

#include <opencv2/core.hpp>
#include <opencv2/features2d.hpp>
#include <opencv2/video/background_segm.hpp>

#include "common/config.h"
#include "common/logging.h"


namespace ae {

namespace tracking {


/** \addtogroup robot-tracking
 * @{
 */


/** \brief Class to narrow down possible robot locations in captured frames.
 *
 * This class encapsulates:
 *  - Background substractor (motion mask).
 *  - Playground mask.
 *  - FAST keypoint detector.
 *  - k-means clustering and centroid merging.
 *
 */
class Segmentation
{
public:
  /** \brief Minimal count of centroids for clustering. */
  static const uint32_t kMinCentroids = 5;

  /** \brief How many centroids need to overlap to decrease centroid count for
   * next iteration. */
  static const uint32_t kRequiredOverlap = 3;

  /** \brief Maximum FAST threshold that can be selected from track bar in debug
   * window. */
  static const int kMaxFastThreshold = 200;

  /** \brief Maximum centroid response that can be selected from track bar in
   * debug window. */
  static const int kMaxResponseThreshold = 4000;

  /** \brief Default size of robot body in captured frames in pixels. */
  static const uint32_t kDefaultRobotSize = 26;

  /** \brief Default FAST keypoint detector threshold. */
  static const uint32_t kDefaultFastThreshold = 70;

  /** \brief Default centroid response threshold.
   *
   * Coresponds to the sum of all keypoint responses of given centroid.
   * If FAST threshold is set to T and count of keypoints in centroid is N then
   * the centroid will have response R >= T * N.
   */
  static const int32_t kDefaultResponseThreshold = 1000;

  /** \brief Whether background substraction is used by default. */
  static const bool kDefaultBackgroundSubstraction = false;

public:
  /** \brief Constructor.
   *
   * \param input_size Resolution if input frames to initialize background
   * substractor.
   */
  Segmentation(cv::Size input_size);

  /** \brief Compute possible robot locations from captured image frame.
   *
   * Following steps are executed:
   *  1. (Optional) Update background substractor model and extract binary
   *     motion mask.
   *  2. Create detection mask by union of motion mask and playground edge mask.
   *  3. Extract FAST keypoints from parts of input frame marked by detection
   *     mask.
   *  4. Cluster found keypoints into centroids using k-means.
   *  5. Merge centroids that are less then m_robot_size away from each other.
   *  6. Calculate number of centroids needed for next iteration based on count
   *     of merged centroids.
   *  7. Discard centroids whose response is lower than m_response_threshold.
   *  8. Return remaining centroids as possible robot locations.
   *
   * \param frame
   * Grayscale image captured by camera.
   *
   * \returns List of possible robot positions in image (pixel position).
   */
  std::vector<cv::Point> compute(const cv::Mat &frame);

  /** \brief Get current detection mask. */
  const cv::Mat& get_mask() const { return m_mask; }

  /** \brief Get current playground mask. */
  const cv::Mat& get_playground_mask() const { return m_playground_mask; }

  /** \brief Get list of keypoint extracted from last frame. */
  const std::vector<cv::KeyPoint>& getKeypoints() const { return m_keypoints; }

  /** \brief Get all centroids (after merging) found in last frame. */
  const std::vector<cv::Point3f>& getWeightedCentroids() const { return m_centroids; }

  /** \brief Get current FAST keypoint detector threshold. */
  uint32_t getFastThreshold() const { return m_fast_threshold; }

  /** \brief Get current centroid response threshold. */
  float getResponseThreshold() const { return m_response_threshold; }

  /** \brief Set new playground mask.
   *
   * \param corners
   * List of 4 corners that  mark the corners of playground in input images.
   * Corners are ordered as follows:
   *  - top left
   *  - top right
   *  - bottom right
   *  - bottom left
   *
   * Corner coordinates corespond to pixel positions in image.
   */
  void setPlaygroundCorners(const std::vector<cv::Point> &corners);

  /** \brief Set size of robot body in image.
   *
   * \param value
   * Size of robot body in pixels.
   */
  void setRobotSize(uint32_t value) { m_robot_size = value; }

  /** \brief Set new FAST threshold. */
  void setFastThreshold(int value) { m_fast_threshold = value; }

  /** \brief Set new centroid response threshold. */
  void setResponseThreshold(int value) { m_response_threshold = value; }

  /** \brief Enable or disable background substraction. */
  void setBackgroundSubstraction(bool value) { m_background_sub = value; }

  /** \brief Load configurable parameters from JSON object.
   *
   * The following setings are supported:
   *  - *playground_corners* (array).
   *    Array of four points that mark the edges of playground in input frames.
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
   *    also valid in configuration file:
   *
   *        "robot_tracking":
   *        {
   *          "playground_corners": [[71, 13], [617, 28], [605, 338], [65, 312]]
   *          "segmentation":
   *          {
   *
   *          }
   *        }
   *
   *  - *robot_size* (unsigned int)
   *    Size of robot body in input frames in pixels.
   *
   *  - *fast_threshold* (unsigned int)
   *    Value of FAST threshold from 0 to kMaxFastThreshold.
   *
   *  - *response_threshold* (unsigned int)
   *    Value of centroid response threshold from 0 to kMaxResponseThreshold.
   *
   *  - *background_substraction* (bool)
   *    Enables background substraction.
   *
   * \param settings
   * JSON object.
   */
  void loadConfiguration(const nlohmann::json &settings);

  /** \brief Create OpenCV highgui trackbar for controlling value of FAST
   * threshold.
   *
   * Trackbar limits are from 0 to kMaxFastThreshold.
   *
   * \param window_name
   * Identifier of OpenCV window that will contain the trackbar.
   */
  void createFastTrackbar(const std::string &window_name);

  /** \brief Create OpenCV highgui trackbar for controlling value of centroid
   * response threshold.
   *
   * Trackbar limits are from 0 to kMaxResponseThreshold.
   *
   * \param window_name
   * Identifier of OpenCV window that will contain the trackbar.
   */
  void createResponseTrackbar(const std::string &window_name);

private:
  /** \brief Updates background substractor and computes keypoints.
   *
   * \param
   * Video frame from a video stream to be analyzed.
   *
   * \returns
   * Array of detected keypoints.
   */
  std::vector<cv::KeyPoint> computeKeypoints(const cv::Mat &frame);

  /** \brief Handles clustering of keypoint data.
   *
   * \param points
   * 3D points representing x, y coordinates and response of keypoint.
   *
   * \returns
   * Array of centroid locations that are above centroid response threshold.
   */
  std::vector<cv::Point> findCentroids(const std::vector<cv::Point3f> &points);

private:
  /** \brief Resolution of video frames.
   *
   * This value is set from constructor only.
   */
  cv::Size m_input_size;

  /** \brief Binary mask selecting playground area in video frame.
   *
   * \see setPlaygroundCorners
   */
  cv::Mat m_playground_mask;

  /** \brief Size of robot body in pixels.
   *
   * This value determines how centroid merging behaves.
   * Centroids are guaranteed to be at least m_robot_size apart from each other.
   * All centroids that are less than m_robot_size away will be merged together.
   *
   * \see setRobotSize
   * \see kDefaultRobotSize
   */
  uint32_t m_robot_size;

  /** \brief Threshold value used by FAST keypoint detector.
   *
   * Bigger threshold means that only more significant edges will be detected
   * resulting in less keypoints.
   *
   * It is important to get enough keypoints for proper clustering but not too
   * many of them which would  artificially increase the number of centroids.
   *
   * Highly dependant on lightning conditions and complexity of playground
   * elements.
   *
   * \see setFastThreshold
   * \see createFastTrackbar
   * \see kDefaultFastThreshold
   */
  int m_fast_threshold;

  /** \brief Threshold for discarding uninteresting centroids.
   *
   * Centroid response is calculated as average keypoint response times keypoint
   * count.
   * Centroids with small amount of keypoints acheive much smaller responses.
   * If response value is less than m_response_threshold centroid will be
   * discarded.
   *
   * Value is dependant mainly on FAST threshold value.
   *
   * \see setResponseThreshold
   * \see createResponseTrackbar
   * \see kDefaultResponseThreshold
   */
  int m_response_threshold;

  /** \brief Decides whether background substractor is enabled.
   *
   * \see setBackgroundSubstraction
   * \see kDefaultBackgroundSubstraction
   */
  bool m_background_sub;

  /** \brief Stores the resulting detection mask obtained by combining
   * playground and motion detection masks.
   *
   * This value is stored for debugging purposes.
   */
  cv::Mat m_mask;

  /** \brief Stores keypoints detected in last frame.
   *
   * This value is stored for debugging purposes.
   */
  std::vector<cv::KeyPoint> m_keypoints;

  /** \brief Number of centroids that keypoints will be divided into.
   *
   * This count is variable and depends on result of centroid merging algorithm:
   *   - Value is incremented by 2 if no centroids were merged in last frame.
   *   - If more than kRequiredOverlap centroids were merged value is decreased by 1.
   *   - Minimal count of centroids is enforced at kMinCentroids.
   *
   * \see findCentroids
   * \see kRequiredOverlap
   * \see kMinCentroids
   */
  uint32_t m_centroid_count;

  /** \brief Centroid positions obtained from k-means clustering of keypoints.
   *
   * This array contains all centroids unlike return value from findCentroids
   * which returns only centroids above response threshold.
   *
   * This value is stored for debugging purposes.
   *
   * \see getWeightedCentroids
   * \see compute
   */
  std::vector<cv::Point3f> m_centroids;

  cv::Ptr<cv::BackgroundSubtractor> m_bgsub;
  cv::Ptr<cv::FastFeatureDetector> m_features;
};


/** @} */


} // namespace tracking

} // namespace ae


/** \brief Support function to natively print keypoints into logs.
 *
 * Output format: ([x, y], response)
 */
inline MAKE_LOGGABLE(cv::KeyPoint, kp, os)
{
  os << "([" << kp.pt.x << ", " << kp.pt.y << "], " << kp.response << ")";
  return os;
}


#endif /* _SEGMENTATION_H_ */
