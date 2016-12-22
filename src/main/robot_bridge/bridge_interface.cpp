#include "bridge_interface.h"


void BridgeResult_Init(struct sBridgeResult *result)
{
  result->id = 0;
  result->type = rand();
  result->state = rand();
  result->action = rand();
  result->fitness = (rand()%1000000)/1000000.0;
  result->uptime = rand();

  result->note = "SOME NOTE";

  result->log_enabled = false;
  result->debug_enabled = false;


  result->x = 0.0;
  result->y = 0.0;
  result->z = 0.0; 

  result->roll = 0.0;
  result->pitch = 0.0;
  result->yaw = 0.0;

  struct sRGBSensor tmp;

  tmp.r = 0;
  tmp.g = 0;
  tmp.b = 0;
  tmp.w = 0;

  /*
  unsigned int i;
  for (i = 0; i < sizeof(result->rgb_sensors); i++)
    result->rgb_sensors[i] = tmp;
    */

}

CBridgeInterface::CBridgeInterface()
{
  BridgeResult_Init(&default_result);
}

CBridgeInterface::~CBridgeInterface()
{

}

struct sBridgeResult CBridgeInterface::get(int idx)
{
  struct sBridgeResult res = default_result;

  mutex.lock();

  if ( (idx >= 0) && (idx < (int)result.size()) )
    res = result[idx];
  mutex.unlock();

  return res;
}

int CBridgeInterface::set(int idx, struct sBridgeResult value)
{
  int res = -1;

  mutex.lock();

  if ( (idx >= 0) && (idx < (int)result.size()) )
  {
    result[idx] = value;
    res = 0;
  }
  else
    res= -1;

  mutex.unlock();


  return res;
}

struct sBridgeResult CBridgeInterface::get_by_id(unsigned int id)
{
  int i, idx = -1;

  for (i = 0; i < (int)result.size(); i++)
    if (id == result[i].id)
    {
      idx = i;
      break;
    }

  return get(idx);
}

int CBridgeInterface::set_by_id(unsigned int id, struct sBridgeResult value)
{
  int i, idx = -1, res = -1;

  for (i = 0; i < (int)result.size(); i++)
    if (id == result[i].id)
    {
      idx = i;
      break;
    }

  if (idx != -1)
  {
    res = set(idx, value);
  }
  else
  {
    mutex.lock();
    result.push_back(value);
    mutex.unlock();
    res = 1;
  }

  return res;
}

int CBridgeInterface::size()
{
  return result.size();
}
