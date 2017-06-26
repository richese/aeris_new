#include <cstdint>

#include <vector>

#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>

#include "common/agent.h"
#include "common/agent_body.h"
#include "common/agent_client.h"
#include "common/config.h"
#include "common/logging.h"
#include "common/timing.h"

#include "tracking.h"


ae::tracking::Path::Path(cv::Point position, uint64_t id, uint16_t type,
                         uint32_t path_length, uint32_t path_sample_avg) :
  color(cv::theRNG().next() % 255, cv::theRNG().next() % 255, cv::theRNG().next() % 255),
  prediction(position),
  seen_for(1),
  miss_count(0),
  history(1, position),
  interface(),
  m_path_length(path_length),
  m_path_sample_avg(path_sample_avg)
{
  interface.id = id;
  interface.type = type;
  interface.body = ae::AgentBody::getBodyType(type);
  interface.color.b = color[0] / 255.0f;
  interface.color.g = color[1] / 255.0f;
  interface.color.r = color[2] / 255.0f;
}


void ae::tracking::Path::update_position(const cv::Point2f pos, bool is_miss)
{
  // smooth and add new robot position
  cv::Point2f new_position = pos;
  size_t i = 1;
  for (auto it = history.rbegin(); it != history.rend() && i < m_path_sample_avg; ++it)
  {
    new_position += *it;
    ++i;
  }
  new_position /= static_cast<float>(i);
  history.push_back(new_position);

  // erase old samples
  if (history.size() > m_path_length)
  {
    history.erase(history.begin());
  }

  // estimate robot speed
  cv::Point2f speed(0.0f, 0.0f);
  if (history.size() > 1)
  {
    auto it = history.rbegin();
    speed = *it - *(it + 1);
  }
  *history.rbegin() += 0.6f * speed; // compensate smoothed robot position

  seen_for += 1;
  if (is_miss)
  {
    miss_count += 1;
  }
  else
  {
    miss_count = 0;
  }

  prediction = *history.rbegin() + speed;

  // update agent interface
  interface.timestamp = ae::time::timestamp();
  interface.expires = ae::time::future_timestamp(ae::time::milliseconds(66));
  interface.position.x = history.rbegin()->x;
  interface.position.y = history.rbegin()->y;
  interface.position.z = 0.0f;
}


cv::Point2f ae::tracking::Path::position() const
{
  return *history.rbegin();
}


ae::tracking::Tracking::Tracking() :
  m_path_length(kDefaultPathLength),
  m_path_sample_avg(kDefaultPathSampleAvg),
  m_match_dist(kDefaultMatchDist),
  m_path_remove_limit(kDefaultPathRemoveLimit),
  m_path_valid_limit(kDefaultPathValidLimit),
  m_tracks(),
  m_agent_type(0),
  m_aeris_client(),
  m_agent_group_id(0),
  m_track_counter(0),
  m_online(false)
{

}


void ae::tracking::Tracking::loadConfiguration(const nlohmann::json &settings)
{
  std::string name;

  // kolko pozicii si ma cesta pamätat pre vykreslovanie drahy
  name = "path_length";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      m_path_length = settings[name];
    }
    else
    {
      LOG(ERROR) << "Tracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned integer"
                 << ". Got: " << settings[name];
    }
  }

  // kolko vzoriek priemerovat pri aktualizacii polohy
  name = "path_sample_avg";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      m_path_sample_avg = settings[name];
    }
    else
    {
      LOG(ERROR) << "Tracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned integer"
                 << ". Got: " << settings[name];
    }
  }

  // maximalna vzdialenost pre priradenie detekcie ku existujucej ceste
  name = "match_dist";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number())
    {
      m_match_dist = settings[name];
    }
    else
    {
      LOG(ERROR) << "Tracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "float"
                 << ". Got: " << settings[name];
    }
  }

  // vymaz cesty, ktore nenasli novu vzorku v tolkoto snimkach
  name = "path_remove_limit";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      m_path_remove_limit = settings[name];
    }
    else
    {
      LOG(ERROR) << "Tracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned integer"
                 << ". Got: " << settings[name];
    }
  }

  // posielaj cestu do aerisu ak uz existuje aspon tolkoto snimok
  name = "path_valid_limit";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_number_unsigned())
    {
      m_path_valid_limit = settings[name];
    }
    else
    {
      LOG(ERROR) << "Tracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned integer"
                 << ". Got: " << settings[name];
    }
  }

  // nastav typ agentov, ktory budu posielany do systemu
  name = "agent_type";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_string())
    {
      std::string agent_name = settings[name];
      const auto &agent_list = ae::config::get["agent_list"];
      if (agent_list.find(agent_name) != agent_list.end())
      {
        m_agent_type = agent_list[agent_name]["interface_type"];
      }
      else
      {
        LOG(ERROR) << "Tracking: Agent list does not contain agent named: "
                   << agent_name;
      }
    }
    else
    {
      LOG(ERROR) << "Tracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "unsigned integer"
                 << ". Got: " << settings[name];
    }
  }


  // nastav transformacnu maticu medzi pixelami  v obraze a poziciou v systeme
  // body idu: top left, top right, bottom right, bottom left
  name = "playground_corners";
  if (settings.find(name) != settings.end())
  {
    if (settings[name].is_array() && settings[name].size() == 4)
    {
      std::vector<cv::Point2f> corners;
      auto &point_list = settings[name];
      for (auto &point : point_list)
      {
        corners.emplace_back(point[0], point[1]);
      }
      setPerspTransform(corners);
    }
    else
    {
      LOG(ERROR) << "Tracking: Invalid setting value for \'" << name
                 << "\'. Expected " << "array of 4 two element arrays"
                 << ". Got: " << settings[name];
    }
  }
}


void ae::tracking::Tracking::connectToAeris()
{
  if (!m_online)
  {
    int64_t id = m_aeris_client.opRequestGroupId();
    if (id == -1)
    {
      m_agent_group_id = 0;
      m_track_counter = 0;
      LOG(INFO) << "Tracking: Not connected to any Aeris server.";
    }
    else
    {
      m_agent_group_id = id;
      m_online = true;
      m_aeris_client.opDisconnect();
      LOG(INFO) << "Tracking: Connected to Aeris server and received agent group id: "
                << m_agent_group_id;
      LOG(INFO) << "Tracking: Using agent interface_type: " << m_agent_type;
    }
  }
}


void ae::tracking::Tracking::setPerspTransform(const std::vector<cv::Point2f> &frame_corners)
{
  cv::Point2f real_size;
  real_size.x = ae::config::get["playground"]["size"][0];
  real_size.y = ae::config::get["playground"]["size"][1];

  std::vector<cv::Point2f> real_corners;
  real_corners.emplace_back(-real_size.x / 2,  real_size.y / 2); // top left
  real_corners.emplace_back( real_size.x / 2,  real_size.y / 2); // top right
  real_corners.emplace_back( real_size.x / 2, -real_size.y / 2); // bottom right
  real_corners.emplace_back(-real_size.x / 2, -real_size.y / 2); // bottom left

  m_persp_transform = cv::getPerspectiveTransform(frame_corners, real_corners);
}


void ae::tracking::Tracking::setPerspTransform(const std::vector<cv::Point> &frame_corners)
{
  std::vector<cv::Point2f> corners;
  for (const auto &c : frame_corners)
  {
    corners.push_back(c);
  }
  setPerspTransform(corners);
}


cv::Point2f ae::tracking::Tracking::getRealPosition(const cv::Point2f &frame_pos)
{
  std::vector<cv::Point2f> input, output;
  input.push_back(frame_pos);
  output.resize(1);
  cv::perspectiveTransform(input, output, m_persp_transform);
  return output[0];
}


void ae::tracking::Tracking::update(const std::vector<cv::Point> &positions)
{
  std::vector<bool> used_position(positions.size(), false);

  for (auto &path : m_tracks)
  {
    float best_dist = 9999999999.9f;
    size_t best_id;

    // update exising paths
    for (size_t i = 0; i < positions.size(); i++)
    {
      cv::Point diff = static_cast<cv::Point>(path.prediction) - positions[i];
      float dist = cv::sqrt(diff.x * diff.x + diff.y * diff.y);
      if (best_dist > dist)
      {
        best_dist = dist;
        best_id = i;
      }
    }

    if (best_dist < m_match_dist)
    {
      path.update_position(positions[best_id]);
      used_position[best_id] = true;
    }
    else
    {
      path.update_position(path.prediction, true);
    }
  }

  // remove stale paths
  auto it = m_tracks.begin();
  for (; it != m_tracks.end();)
  {
    if (it->miss_count >= m_path_remove_limit)
    {
      VLOG(2) << "Removing robot path with id: " << it->interface.id;
      it = m_tracks.erase(it);
    }
    else
    {
      ++it;
    }
  }

  // add new paths from unised detections
  for (size_t i = 0; i < positions.size(); ++i)
  {
    if (!used_position[i])
    {
      uint64_t id = (static_cast<uint64_t>(m_agent_group_id)<<32) + m_track_counter++;
      m_tracks.emplace_back(positions[i], id, m_agent_type, m_path_length, m_path_sample_avg);
      VLOG(2) << "Created robot path with id: " << id;
    }
  }

  if (m_online)
  {
    std::vector<ae::AgentInterface> data;

    for (auto &path : m_tracks)
    {
      if (path.seen_for > m_path_valid_limit)
      {
        data.push_back(path.interface);

        cv::Point2f real_pos = getRealPosition(path.position());
        auto &agent = data.back();
        agent.position.x = real_pos.x;
        agent.position.y = real_pos.y;
      }
    }

    if (m_aeris_client.opAgentCommit(data) < 0)
    {
      m_online = false;
      LOG(ERROR) << "Failed to connect to Aeris server: disabling.";
    }
    else
    {
      m_aeris_client.opDisconnect();
    }
  }
}
