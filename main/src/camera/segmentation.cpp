#include <cstdint>

#include <string>

#include <opencv2/core.hpp>
#include <opencv2/features2d.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/video/background_segm.hpp>
#include <opencv2/bgsegm.hpp>

#include "common/config.h"
#include "common/logging.h"
#include "common/timing.h"

#include "segmentation.h"


Segmentation::Segmentation(cv::Size input_size) :
  m_input_size(input_size),
  m_playground_mask(),
  m_robot_size(kDefaultRobotSize),
  m_fast_threshold(kDefaultFastThreshold),
  m_response_threshold(kDefaultResponseThreshold),
  m_background_sub(kDefaultBackgroundSubstraction),
  m_mask(),
  m_keypoints(),
  m_bgsub(cv::bgsegm::createBackgroundSubtractorMOG(200, 3)),
  // m_bgsub(cv::bgsegm::createBackgroundSubtractorGMG()),
  m_features(cv::FastFeatureDetector::create(80)),
  m_centroid_count(kMinCentroids),
  m_centroids()
{

}


void Segmentation::setPlaygroundCorners(const std::vector<cv::Point> &corners)
{
  if (corners.size() != 4)
  {
    LOG(ERROR) << "Segmentation: Four corners are required to set playground mask.";
    return;
  }

  cv::Mat mask = cv::Mat::zeros(m_input_size, CV_8U);
  std::vector<std::vector<cv::Point>> contours;
  contours.push_back(corners);
  cv::drawContours(mask, contours, 0, cv::Scalar(255), CV_FILLED, 8);

  cv::swap(m_playground_mask, mask);
  if (!m_background_sub)
  {
    m_mask = m_playground_mask;
  }
}


void Segmentation::loadConfiguration(const nlohmann::json &settings)
{
  std::string name;

  name = "playground_corners";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_array() && settings[name].size() == 4)
    {
      std::vector<cv::Point> corners;
      for (auto &point : settings[name])
      {
        corners.emplace_back(point[0], point[1]);
      }
      setPlaygroundCorners(corners);
    }
    else
    {
      LOG(ERROR) << "Segmentation: Invalid setting value for \'" << name
                 << "\'. Expected " << "array of 4 two element arrays"
                 << ". Got: " << settings[name];
    }
  }

  name = "robot_size";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      setRobotSize(settings[name]);
    }
    else
    {
      LOG(ERROR) << "Segmentation: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned number"
                 << ". Got: " << settings[name];
    }
  }

  name = "fast_threshold";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      int threshold = settings[name];
      if (threshold > kMaxFastThreshold)
      {
        threshold = kMaxFastThreshold;
      }
      setFastThreshold(threshold);
    }
    else
    {
      LOG(ERROR) << "Segmentation: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned number"
                 << ". Got: " << settings[name];
    }
  }

  name = "response_threshold";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      int threshold = settings[name];
      if (threshold > kMaxResponseThreshold)
      {
        threshold = kMaxResponseThreshold;
      }
      setResponseThreshold(threshold);
    }
    else
    {
      LOG(ERROR) << "Segmentation: Invalid setting value for \'" << name
                 << "\'. Expected " << "number"
                 << ". Got: " << settings[name];
    }
  }

  name = "background_substraction";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_boolean())
    {
      setBackgroundSubstraction(settings[name]);
    }
    else
    {
      LOG(ERROR) << "Segmentation: Invalid setting value for \'" << name
                 << "\'. Expected " << "boolean"
                 << ". Got: " << settings[name];
    }
  }
}


void Segmentation::createFastTrackbar(const std::string &window_name)
{
  const std::string kTrackbarName = "FAST Threshold";
  cv::createTrackbar(kTrackbarName, window_name, &this->m_fast_threshold, kMaxFastThreshold);
}


void Segmentation::createResponseTrackbar(const std::string &window_name)
{
  const std::string kTrackbarName = "Response Threshold";
  cv::createTrackbar(kTrackbarName, window_name, &this->m_response_threshold, kMaxResponseThreshold);
}


std::vector<cv::Point> Segmentation::compute(const cv::Mat &frame)
{
  std::vector<cv::KeyPoint> keypoints = computeKeypoints(frame);

  std::vector<cv::Point3f> points;
  points.reserve(keypoints.size());
  for (const auto &kp: keypoints)
  {
    points.emplace_back(kp.pt.x, kp.pt.y, kp.response);
  }

  return findCentroids(points);
}


std::vector<cv::KeyPoint> Segmentation::computeKeypoints(const cv::Mat &frame)
{
  std::vector<cv::KeyPoint> keypoints;

  m_features->setThreshold(m_fast_threshold);

  // apply background substraction and detect keypoints
  if (m_background_sub)
  {
    cv::Mat fgmask;
    {
      TIMED_SCOPE(motion_detect_timer, "Motion detection");
      m_bgsub->apply(frame, fgmask);
      cv::GaussianBlur(fgmask, fgmask, cv::Size(11, 11), 3.5);
      cv::threshold(fgmask, fgmask, 10, 255, cv::THRESH_BINARY);
      cv::bitwise_and(fgmask, m_playground_mask, fgmask);
    }
    {
      TIMED_SCOPE(keypoint_detect_timer, "Keypoint detection");
      m_features->detect(frame, keypoints, fgmask);
    }
    m_mask = fgmask;
  }
  else
  {
    TIMED_SCOPE(keypoint_detect_timer, "Keypoint detection");
    m_features->detect(frame, keypoints, m_playground_mask);
  }

  VLOG(9) << "Segmentation: Detected " << keypoints.size() << " keypoints.";

  m_keypoints = keypoints;
  return keypoints;
}


std::vector<cv::Point> Segmentation::findCentroids(const std::vector<cv::Point3f> &points)
{
  TIMED_SCOPE(kmeans_timer, "Clustering");

  std::vector<int> kmeans_labels;
  cv::Mat kmeans_output;

  if (points.size() <= m_centroid_count)
  {
    LOG(WARNING) << "Segmentation: Not enough keypoints in input frame.";
    return std::vector<cv::Point>();
  }

  kmeans_labels.reserve(points.size());

  // find centroids
  cv::kmeans(points,
             m_centroid_count,
             kmeans_labels,
             cv::TermCriteria(cv::TermCriteria::EPS + cv::TermCriteria::COUNT, 10, 1.0),
             3,
             cv::KmeansFlags::KMEANS_PP_CENTERS,
             kmeans_output);

  std::vector<cv::Point3f> centroids;
  centroids.reserve(kmeans_output.rows);
  for (int i = 0; i < kmeans_output.rows; ++i)
  {
    centroids.push_back(*kmeans_output.ptr<cv::Point3f>(i));
  }

  // merge overlapping centroids
  for (size_t i = 0; i < centroids.size(); ++i)
  {
    for (size_t j = i + 1; j < centroids.size(); )
    {
      cv::Point3f diff = centroids[j] - centroids[i];
      float dist = cv::sqrt(diff.x * diff.x + diff.y * diff.y);
      if (dist < m_robot_size)
      {
        VLOG(8) << "Centroids "
                << i << " " << centroids[i] << " and "
                << j << " " << centroids[j] << " are overlapping.";
        centroids[i] += diff / 2;
        centroids.erase(centroids.begin() + j);

        for (auto &label : kmeans_labels)
        {
          if (label == (ssize_t) j)
          {
            label = i;
          }
          else
          {
            // decrement labels when merging centroids
            if (label > (ssize_t) j)
            {
              label -= 1;
            }
          }
        }
        i = -1;
        break;
      }
      else
      {
        j += 1;
      }
    }
  }

  // set centroid count for next iteration
  const size_t merged_centroids = m_centroid_count - centroids.size();
  if (merged_centroids == 0)
  {
    m_centroid_count += 2;
    VLOG(7) << "Segmentation: Increasing centroid count to " << m_centroid_count;
  }
  else
  {
    if (merged_centroids > 3 && m_centroid_count > kMinCentroids)
    {
      m_centroid_count -= 1;
      VLOG(7) << "Segmentation: Decreasing centroid count to " << m_centroid_count;
    }
  }

  // get number of keypoints per centroid
  std::vector<int> points_per_centroid(centroids.size(), 0);
  for (auto &label : kmeans_labels)
  {
    points_per_centroid[label] += 1;
  }

  std::vector<cv::Point> interesting_centroids;
  for (size_t i = 0; i < centroids.size(); ++i)
  {
    // weight centroid responses with their keypoint count
    cv::Point3f &centroid = centroids[i];
    centroid.z *= points_per_centroid[i];

    // filter centroids with weak response from output
    if (centroid.z > m_response_threshold)
    {
      interesting_centroids.emplace_back(centroid.x, centroid.y);
    }
  }

  m_centroids = centroids;
  return interesting_centroids;
}
