#ifndef _BRIDGE_INTERFACE_H_
#define _BRIDGE_INTERFACE_H_

#include <vector>
#include <mutex>

struct sRGBSensor
{
  unsigned int r, g, b, w;
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
  std::string note;

  //options
  bool log_enabled;
  bool debug_enabled;

  float x, y, z;
  float roll, pitch, yaw;

  struct sRGBSensor rgb_sensors[4];
};

void BridgeResult_Init(struct sBridgeResult *result);

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
};


#endif
