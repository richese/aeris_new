#include <string>
#include <stdexcept>

#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/ml.hpp>
#include <opencv2/objdetect.hpp>

#include "common/logging.h"

#include "detector.h"


ae::tracking::Detector::Detector() :
  m_hog(cv::Size(40, 40), cv::Size(10, 10), cv::Size(5, 5), cv::Size(5, 5), 9),
  m_svm()
{

}


std::vector<cv::Point> ae::tracking::Detector::detect(const cv::Mat &frame, const std::vector<cv::Point> &roi)
{
  // TIMED_FUNC(detect_timer);

  const cv::Point shift(m_hog.winSize.width / 2, m_hog.winSize.height / 2);
  std::vector<cv::Point> detections;

  for (const cv::Point &center : roi)
  {
    cv::Rect area(center - shift, center + shift);
    cv::Mat cutout;
    std::vector<float> descriptors;
    cv::Mat prediction;

    try
    {
      cutout = frame(area);
    }
    catch (const std::exception &e)
    {
      LOG(WARNING) << "Out of bound detection.";
      LOG(WARNING) << e.what();
      continue;
    }

    {
      // extract HOG descriptors from selected area
      TIMED_SCOPE(hog_timer, "HOG extraction");
      m_hog.compute(cutout, descriptors);
    }
    {
      // classify extracted descriptors
      TIMED_SCOPE(svm_timer, "SVM classification");
      m_svm->predict(descriptors, prediction);
    }

    // add positive detections to output array
    if (prediction.at<float>() == 1)
    {
      detections.push_back(center);
    }
  }

  return detections;
}


void ae::tracking::Detector::setHog(cv::Size win_size, cv::Size block_size, cv::Size block_stride, cv::Size cell_size, int nbins)
{
  m_hog = cv::HOGDescriptor(win_size, block_size, block_stride, cell_size, nbins);
}


void ae::tracking::Detector::setSvm(const std::string &filename)
{
  m_svm = cv::ml::SVM::load(filename);
  if (m_svm.empty())
  {
    throw std::runtime_error("Detector: Failed to load SVM from file: " + filename);
  }
}


void ae::tracking::Detector::loadConfiguration(const nlohmann::json &settings)
{
  std::string name;

  name = "hog_parameters";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_array() && settings[name].size() == 5)
    {
      const nlohmann::json &p = settings[name];
      setHog(cv::Size(p[0], p[0]),
             cv::Size(p[1], p[1]),
             cv::Size(p[2], p[2]),
             cv::Size(p[3], p[3]),
             p[4]);
    }
    else
    {
      LOG(ERROR) << "Detector: Invalid setting value for \'" << name
                 << "\'. Expected " << "array of 5 integers"
                 << ". Got: " << settings[name];
    }
  }

  name = "svm";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_string())
    {
      setSvm(ae::config::path(ae::config::DIR_ROOT, settings[name]));
    }
    else
    {
      LOG(ERROR) << "Detector: Invalid setting value for \'" << name
                 << "\'. Expected " << "path to file"
                 << ". Got: " << settings[name];
    }
  }
}
