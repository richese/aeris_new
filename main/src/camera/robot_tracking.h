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


class RobotTracking
{
public:

  enum DebugFlags
  {
    DEBUG_ENABLE     = 0x0001,
    DEBUG_FG_MASK    = 0x0002,
    DEBUG_FG_IMAGE   = 0x0004,
    DEBUG_KEYPOINTS  = 0x0008,
    DEBUG_CENTROIDS  = 0x0010,
    DEBUG_DETECTIONS = 0x0020,
    DEBUG_TRACKS     = 0x0040,
    DEBUG_SAVE_DET   = 0x0080
  };

  static const std::string kDebugWindow;

  static const cv::Size kStreamResolution;

  RobotTracking(nlohmann::json settings = nlohmann::json::object());

  void run();

private:
  std::vector<cv::Point> selectPlayground(const cv::Mat &frame);

private:
  uint16_t m_debug;
  uint16_t m_framerate;
  cv::VideoCapture m_video_stream;

  Segmentation m_segmentation;
  Detector m_detector;
  Tracking m_tracking;
};


#endif /* _ROBOT_TRACKING_ */
