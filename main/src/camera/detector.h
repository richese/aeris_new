#ifndef _DETECTOR_H_
#define _DETECTOR_H_

#include <string>

#include <opencv2/core.hpp>
#include <opencv2/ml.hpp>
#include <opencv2/objdetect.hpp>

#include "common/config.h"


class Detector
{
public:
  Detector();

  std::vector<cv::Point> detect(const cv::Mat &frame, const std::vector<cv::Point> &roi);

  void setHog(cv::Size win_size, cv::Size block_size, cv::Size block_stride, cv::Size cell_size, int nbins);
  void setSvm(const std::string &filename);

  void loadConfiguration(const nlohmann::json &settings);

  void train();

private:
  cv::HOGDescriptor m_hog;
  cv::Ptr<cv::ml::SVM> m_svm;
};


#endif /* _DETECTOR_H_ */
