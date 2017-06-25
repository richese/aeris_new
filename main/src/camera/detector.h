#ifndef _DETECTOR_H_
#define _DETECTOR_H_

#include <string>

#include <opencv2/core.hpp>
#include <opencv2/ml.hpp>
#include <opencv2/objdetect.hpp>

#include "common/config.h"


namespace ae {

namespace tracking {


/** \addtogroup robot-tracking
 * @{
 */


/** \brief Decides whether robots are present in selected areas. */
class Detector
{
public:
  /** Initializes HOG descriptor with default parameters and creates empty SVM
   * model.
   */
  Detector();

  /** \brief Checks specified frame areas for robot presence.
   *
   * The following is executed for each region of interest:
   *   1. A rectangular area with the size of HOG window is selected around
   *      provided point.
   *   2. HOG descriptors are extracted from selected area.
   *   3. Extracted descriptors are classified in trained SVM clasifier.
   *   4. If classification result is positive the center of region of interest
   *      is added to output array.
   *
   * \param frame
   * Video frame.
   *
   * \param roi
   * Array of points that mark regions of interest in received frame.
   *
   * \returns
   * Array of locations with positive robot detection.
   */
  std::vector<cv::Point> detect(const cv::Mat &frame, const std::vector<cv::Point> &roi);

  /** \brief Set parameters of HOG descroptors.
   *
   * These must match with descriptors used in SVM model.
   *
   * \param win_size
   * Size of window used for descriptor extraction.
   *
   * \param block_size
   * Size of light normalization blocks.
   *
   * \param block_stride
   * Overlap of blocks.
   *
   * \param cell_size
   * Size of cell for histogram extraction.
   *
   * \param nbins
   * Number of histogram orientations per cell.
   */
  void setHog(cv::Size win_size, cv::Size block_size, cv::Size block_stride, cv::Size cell_size, int nbins);

  /** \brief Load SVM model from file.
   *
   * \param filename
   * Path to OpenCV xml file of SVM model generated by train_svm.elf utility.
   */
  void setSvm(const std::string &filename);

  /** \brief Load configurable parameters from JSON object.
   *
   * Supported settings:
   *  - *hog_parameters* (array)
   *
   *    Example:
   *
   *        {
   *          "hog_parameters": [40, 8, 4, 4, 9]
   *        }
   *
   *  - *svm* (string)
   *    path to SVM model xml file.
   *    It can be an absolute path or relative path to MAIN_ROOT_DIR.
   *
   * \param settings
   */
  void loadConfiguration(const nlohmann::json &settings);

private:
  cv::HOGDescriptor m_hog;
  cv::Ptr<cv::ml::SVM> m_svm;
};


/** @} */


} // namespace tracking

} // namespace ae


#endif /* _DETECTOR_H_ */
