#ifndef _BRIDGE_INTERFACE_H_
#define _BRIDGE_INTERFACE_H_

#include <vector>
#include <mutex>

struct sRGBSensor
{
  int r, g, b, w, d;
};

struct sBridgeResult
{
  //common information
  unsigned int id;
  unsigned int type;
  unsigned int state;
  unsigned int action;
  float fitness;

  unsigned int uptime;
  double time;

  std::string note;

  //IMU
  float x, y, z;
  float roll, pitch, yaw;

  //RGB sensors
  std::vector<struct sRGBSensor> rgb_sensors;

  std::string terminal;

  //options
  bool log_enabled;
  bool log_clear;
  bool debug_enabled;
};

void BridgeResult_Init(struct sBridgeResult *result, bool random = false);

class CBridgeInterface
{
  private:
    std::mutex mutex;

    struct sBridgeResult default_result;
    std::vector<struct sBridgeResult> result;

  public:
    CBridgeInterface();
    ~CBridgeInterface();

    struct sBridgeResult get(int idx);
    int set(int idx, struct sBridgeResult value);

    struct sBridgeResult get_by_id(unsigned int id);
    int set_by_id(unsigned int id, struct sBridgeResult value);

    int size();

    void add_to_log(int idx);
};


#endif
