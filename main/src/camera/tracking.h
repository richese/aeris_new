#ifndef _TRACKING_H_
#define _TRACKING_H_

#include <cstdint>

#include <vector>

#include <opencv2/core.hpp>

#include "common/agent.h"
#include "common/agent_client.h"
#include "common/config.h"


class Path
{
public:
  Path(cv::Point position, uint64_t id, uint16_t type, uint32_t path_length, uint32_t m_path_sample_avg);

  void update_position(const cv::Point2f pos, bool is_miss = false);

  cv::Point2f position() const;

  cv::Scalar color;
  cv::Point2f prediction;

  uint32_t seen_for;
  uint32_t miss_count;
  float miss_penalty;

  std::vector<cv::Point2f> history;

  ae::sAgentInterface interface;

private:
  uint32_t m_path_length;
  uint32_t m_path_sample_avg;
};


class Tracking
{
public:
  static const uint32_t kDefaultPathLength = 100;
  static const uint32_t kDefaultPathSampleAvg = 3;
  static constexpr float kDefaultMatchDist = 30.0f;
  static const uint32_t kDefaultPathRemoveLimit = 50;
  static const uint32_t kDefaultPathValidLimit = 55;


  Tracking();
  ~Tracking() {}

  void loadConfiguration(const nlohmann::json &settings);
  void connectToAeris();
  void setPerspTransform(const std::vector<cv::Point2f> &frame_corners);
  void setPerspTransform(const std::vector<cv::Point> &frame_corners);
  cv::Point2f getRealPosition(const cv::Point2f &frame_pos);

  void update(const std::vector<cv::Point> &positions);

  const std::vector<Path>& tracks() const { return m_tracks; }
  uint32_t getPathLength() const { return m_path_length; }

private:

  std::vector<Path> m_tracks;

  uint16_t m_agent_type;
  ae::Client m_aeris_client;
  uint32_t m_agent_group_id;
  uint32_t m_track_counter;
  bool m_online;

  uint32_t m_path_length;
  uint32_t m_path_sample_avg;
  float m_match_dist;
  uint32_t m_path_remove_limit;
  uint32_t m_path_valid_limit;

  cv::Mat m_persp_transform;
};


#endif /* _TRACKING_H_ */
