#include <cstdint>

#include <exception>
#include <stdexcept>
#include <string>

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/videoio.hpp>

#include "common/config.h"
#include "common/logging.h"
#include "common/signals.h"
#include "common/timing.h"

#include "segmentation.h"
#include "detector.h"
#include "tracking.h"

#include "robot_tracking.h"


const std::string RobotTracking::kDebugWindow = "Tracking Debug";
// const cv::Size RobotTracking::kStreamResolution(1920, 1080);
const cv::Size RobotTracking::kStreamResolution(640, 360);


RobotTracking::RobotTracking(nlohmann::json settings) :
  m_debug(0x0000),
  m_framerate(30),
  m_video_stream(),
  m_segmentation(kStreamResolution),
  m_detector(),
  m_tracking()
{
  std::string name;

  name = "debug";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_boolean())
    {
      if (settings[name].get<bool>())
      {
        m_debug |= DEBUG_ENABLE | DEBUG_TRACKS;
      }
    }
    else
    {
      LOG(ERROR) << "RobotTracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "boolean"
                 << ". Got: " << settings[name];
    }
  }

  name = "framerate";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      m_framerate = settings[name];
    }
    else
    {
      LOG(ERROR) << "RobotTracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned number"
                 << ". Got: " << settings[name];
    }
  }

  name = "stream";
  std::string source_name;
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      m_video_stream = cv::VideoCapture(settings[name].get<int>());
      source_name = "camera " + std::to_string(settings[name].get<int>());
    }
    else {
      if (settings[name].is_string())
      {
        std::string real_path = ae::config::path(ae::config::DIR_ROOT, settings[name]);
        m_video_stream = cv::VideoCapture(real_path);
        source_name = "file " + real_path;
      }
      else
      {
        LOG(ERROR) << "RobotTracking: Invalid setting value for \'" << name
                   << "\'. Expected " << "unsigned number or string"
                   << ". Got: " << settings[name];
        throw std::runtime_error("Configuration parsing error.");
      }
    }
  }
  else
  {
    m_video_stream = cv::VideoCapture(0);
    source_name = "camera 0";
  }

  if (!m_video_stream.isOpened())
  {
    LOG(ERROR) << "RobotTracking: Failed to open video source from "
               << source_name << '.';
    throw std::runtime_error("Input video device error.");
  }
  m_video_stream.set(cv::CAP_PROP_FRAME_WIDTH, kStreamResolution.width);
  m_video_stream.set(cv::CAP_PROP_FRAME_HEIGHT, kStreamResolution.height);
  m_video_stream.set(cv::CAP_PROP_FPS  , m_framerate);
  LOG(INFO) << "RobotTracking: Using video stream from " << source_name << " at "
            << m_video_stream.get(cv::CAP_PROP_FRAME_WIDTH) << "x"
            << m_video_stream.get(cv::CAP_PROP_FRAME_HEIGHT) << "@"
            << m_video_stream.get(cv::CAP_PROP_FPS);

  name = "playground_corners";
  if (settings.find(name) == settings.end())
  {
    cv::Mat frame;
    m_video_stream >> frame;
    if (!frame.empty())
    {
      auto corners = selectPlayground(frame);
      auto json_corners = nlohmann::json::array();
      for (const cv::Point &c : corners)
      {
        auto p = nlohmann::json::array();
        p.push_back(c.x);
        p.push_back(c.y);
        json_corners.push_back(p);
      }
      settings[name] = json_corners;
      LOG(DEBUG) << json_corners;
    }
  }

  name = "segmentation";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_object())
    {
      auto seg_settings = settings[name];
      if (seg_settings.find("playground_corners") == seg_settings.end() &&
          settings.find("playground_corners") != settings.end())
      {
        // forward playground corners setting if needed
        seg_settings["playground_corners"] = settings["playground_corners"];
      }

      m_segmentation.loadConfiguration(seg_settings);
    }
    else
    {
      LOG(ERROR) << "RobotTracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "object"
                 << ". Got: " << settings[name];
    }
  }

  name = "detector";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_object())
    {
      m_detector.loadConfiguration(settings[name]);
    }
    else
    {
      LOG(ERROR) << "RobotTracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "object"
                 << ". Got: " << settings[name];
    }
  }

  name = "tracking";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_object())
    {
      auto track_setting = settings[name];
      if (track_setting.find("playground_corners") == track_setting.end() &&
          settings.find("playground_corners") != settings.end())
      {
        // forward playground corners setting if needed
        track_setting["playground_corners"] = settings["playground_corners"];
      }

      m_tracking.loadConfiguration(track_setting);
    }
    else
    {
      LOG(ERROR) << "RobotTracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "object"
                 << ". Got: " << settings[name];
    }
  }

  m_tracking.connectToAeris();
}


void RobotTracking::run()
{
  bool running = true;
  cv::Mat frame, frame_gray, frame_display;
  std::vector<cv::Point> centroids;
  std::vector<cv::Point> robots;

  const auto frame_period = ae::time::microseconds((int)(1.0 / (double)m_framerate * 1000000.0));
  auto next_frame = ae::time::clock::now();

  if (m_debug & DEBUG_ENABLE)
  {
    cv::namedWindow(kDebugWindow);
    m_segmentation.createFastTrackbar(kDebugWindow);
    m_segmentation.createResponseTrackbar(kDebugWindow);
  }

  while (running && !ae::signal::exit())
  {
    m_video_stream >> frame;
    if (frame.empty())
    {
      LOG(INFO) << "RobotTracking: Reached end of input stream.";
      break;
    }

    {
      TIMED_SCOPE(detection_loop, "Detection Total");

      cv::cvtColor(frame, frame_gray, cv::COLOR_BGR2GRAY);
      cv::equalizeHist(frame_gray, frame_gray);

      centroids = m_segmentation.compute(frame_gray);

      robots = m_detector.detect(frame_gray, centroids);

      m_tracking.update(robots);
    }

    // debug
    if (m_debug & DEBUG_ENABLE)
    {
      TIMED_SCOPE(debug_timer, "Debug");

      frame.copyTo(frame_display);

      int key = cv::waitKey(1);

      std::string display_text;

      if (m_debug & DEBUG_FG_MASK)
      {
        imshow("Foreground Mask", m_segmentation.get_mask());
      }

      if (m_debug & DEBUG_FG_IMAGE)
      {
        cv::Mat fgimg;
        frame.copyTo(fgimg, m_segmentation.get_mask());
        imshow("Foreground Image", fgimg);
      }

      if (m_debug & DEBUG_KEYPOINTS)
      {
        cv::drawKeypoints(frame_display, m_segmentation.getKeypoints(), frame_display);
        display_text += "K=";
        display_text += std::to_string(m_segmentation.getKeypoints().size());
        display_text += "  ";

        VLOG_EVERY_N(100, 2) << "Keypoints: " << m_segmentation.getKeypoints();
      }

      if (m_debug & DEBUG_CENTROIDS)
      {
        float threshold = m_segmentation.getResponseThreshold();
        for (const auto &wc : m_segmentation.getWeightedCentroids())
        {
          const cv::Point position(wc.x, wc.y);

          cv::Scalar color = cv::Scalar(0, 0, 255);
          if (wc.z > threshold)
          {
            color = cv::Scalar(0, 255, 0);
          }

          cv::circle(frame_display, position, 4, color, cv::FILLED, cv::LINE_AA);

          cv::putText(frame_display,
                  std::to_string(static_cast<int>(wc.z)),
                  position + cv::Point(5, 5),
                  cv::FONT_HERSHEY_PLAIN,
                  1,
                  color);
          VLOG_EVERY_N(100, 2) << "Centroids: " << m_segmentation.getWeightedCentroids();
        }

        display_text += "C=" ;
        display_text += std::to_string(m_segmentation.getWeightedCentroids().size());
        display_text += "  ";
      }

      if (m_debug & DEBUG_DETECTIONS)
      {
        for (auto d : robots)
        {
          cv::Rect area(d - cv::Point(20, 20), d + cv::Point(20, 20));
          cv::rectangle(frame_display, area.tl(), area.br(), cv::Scalar(0, 255, 0));
        }

        display_text += "D=" ;
        display_text += std::to_string(robots.size());
        display_text += "  ";
      }

      if (m_debug & DEBUG_TRACKS)
      {
        const auto &tracks = m_tracking.tracks();
        std::vector<cv::Point> track_points;
        track_points.reserve(m_tracking.getPathLength());

        for (const auto &path : tracks)
        {
          track_points.clear();
          for (auto &p : path.history)
          {
            track_points.push_back(p);
          }
          cv::polylines(frame_display, track_points, false, path.color, 2);
          cv::drawMarker(frame_display, static_cast<cv::Point>(path.prediction), path.color, cv::MARKER_TILTED_CROSS);
        }
      }

      if (m_debug & DEBUG_SAVE_DET)
      {
        const std::string timestamp = std::to_string(ae::time::timestamp());
        int cnt = 0;

        for (auto d : centroids)
        {
          std::string filename = timestamp + "_" + std::to_string(cnt++) + "_detection.png";
          cv::Rect area(d - cv::Point(20, 20), d + cv::Point(20, 20));
          imwrite(filename, frame_gray(area));
        }
      }

      if (!display_text.empty())
      {
        cv::putText(frame_display, display_text, cv::Point(5, 360),
                    cv::FONT_HERSHEY_PLAIN, 1.0, cv::Scalar(0, 0, 0),
                    2, cv::LINE_8);
        cv::putText(frame_display, display_text, cv::Point(5, 360),
                    cv::FONT_HERSHEY_PLAIN, 1.0, cv::Scalar(255, 255, 255),
                    1, cv::LINE_8);
      }

      cv::imshow(kDebugWindow, frame_display);

      switch (key)
      {
        // ESC - ukonci program
        case 27:
          running = false;
          break;

        // r - zapni ukladanie vsetkych najdenych detekcii
        case 'r':
          m_debug ^= DEBUG_SAVE_DET;
          break;

        // t - zapni zobrazenie historie drah robotov
        case 't':
          m_debug ^= DEBUG_TRACKS;
          break;

        // p - nastav pevnu masku popredia hracej plochy
        case 'p':
        {
          std::vector<cv::Point> corners = selectPlayground(frame);
          m_segmentation.setPlaygroundCorners(corners);
          m_tracking.setPerspTransform(corners);
        } break;

        // a - uloz obrazok cierno bielej predspracovanej snimky
        case 'a':
        {
          const std::string timestamp = std::to_string(ae::time::timestamp());
          std::string filename = timestamp + "_gray.png";
          imwrite(filename, frame_gray);
          LOG(INFO) << "Saved image: " << filename;
        } break;

        // s - uloz obrazky vsetkych otvorenych okien
        case 's':
        {
          const std::string timestamp = std::to_string(ae::time::timestamp());

          std::string filename = timestamp + "_frame.png";
          imwrite(filename, frame_display);
          LOG(INFO) << "Saved image: " << filename;

          if (m_debug & DEBUG_FG_IMAGE)
          {
            cv::Mat fgimg;
            frame.copyTo(fgimg, m_segmentation.get_mask());

            filename = timestamp + "_fgimg.png";
            imwrite(filename, fgimg);
            LOG(INFO) << "Saved image: " << filename;
          }

          if (m_debug & DEBUG_FG_MASK)
          {
            filename = timestamp + "_fgmask.png";
            imwrite(filename, m_segmentation.get_mask());
            LOG(INFO) << "Saved image: " << filename;

            filename = timestamp + "_pgmask.png";
            imwrite(filename, m_segmentation.get_playground_mask());
            LOG(INFO) << "Saved image: " << filename;
          }
        } break;

        // zapni zobrazenie detekcii
        case 'd':
          m_debug ^= DEBUG_DETECTIONS;
          break;

        // zapni zobrazenie centroidov
        case 'c':
          m_debug ^= DEBUG_CENTROIDS;
          break;

        // zapni zobrazenie popredia
        case 'f':
          m_debug ^= DEBUG_FG_IMAGE;
          if ((m_debug & DEBUG_FG_IMAGE) == 0)
          {
            cv::destroyWindow("Foreground Image");
          }
          break;

        // zapni zobrazenie vyznamnych bodov
        case 'k':
          m_debug ^= DEBUG_KEYPOINTS;
          break;

        // zapni zobrazenie masky popredia
        case 'm':
          m_debug ^= DEBUG_FG_MASK;
          if ((m_debug & DEBUG_FG_MASK) == 0)
          {
            cv::destroyWindow("Foreground Mask");
          }
          break;
      }
    }

    next_frame += frame_period;
    if (next_frame > ae::time::clock::now())
    {
      ae::time::sleep_until(next_frame);
    }
    else
    {
      using std::chrono::duration_cast;
      auto time_left = next_frame - ae::time::clock::now();
      LOG(WARNING) << "Main loop lagging by: [" << duration_cast<ae::time::milliseconds>(time_left).count() << " ms]";
      next_frame = ae::time::clock::now();
    }
  }
}


void playgroundSelectCallback(int event, int x, int y, int flags, void *data)
{
  (void)flags;
  if (data == nullptr)
  {
    return;
  }
  std::vector<cv::Point>* corners = static_cast<std::vector<cv::Point>*>(data);

  if (event == cv::EVENT_LBUTTONDOWN)
  {
   if (corners->size() == 4)
   {
     corners->erase(corners->begin());
   }
   corners->emplace_back(x, y);
   LOG(INFO) << "Selected corner " << corners->back();
  }

  if (event == cv::EVENT_RBUTTONDOWN)
  {
   corners->clear();
   LOG(INFO) << "Erased all selected corners.";
  }
}


std::vector<cv::Point> RobotTracking::selectPlayground(const cv::Mat &frame)
{
  const std::string kCornerSelWindow = "Select corners";
  std::vector<cv::Point> corners;
  cv::Mat frame_display;
  cv::Scalar color(0, 255, 0);

  cv::namedWindow(kCornerSelWindow);
  cv::setMouseCallback(kCornerSelWindow, playgroundSelectCallback, &corners);

  for (;;) {
    frame.copyTo(frame_display);

    int i = 0;
    for (const cv::Point &corner : corners)
    {
      cv::circle(frame_display, corner, 4, color, 3);
      cv::putText(frame_display, std::to_string(++i), corner + cv::Point(5, 5),
                  cv::FONT_HERSHEY_PLAIN, 1.0, color,
                  1, cv::LINE_8);
    }
    cv::imshow(kCornerSelWindow, frame_display);

    int key = cv::waitKey(30);
    if (key == 27 && corners.size() == 4) // ESC
    {
      break;
    }
  }

  cv::destroyWindow(kCornerSelWindow);
  return corners;
}
