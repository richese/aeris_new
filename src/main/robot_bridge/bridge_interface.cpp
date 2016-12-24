#include "bridge_interface.h"


void BridgeResult_Init(struct sBridgeResult *result, bool random)
{
  int v = 0;
  if (random)
    v = 1;

  result->id = 0;
  result->type = v*rand();
  result->state = v*rand();
  result->action = v*rand();
  result->fitness = v*(rand()%1000000)/1000000.0;
  result->uptime = v*rand();
  result->time = 0.0;

  result->note = "SOME NOTE";

  result->log_enabled = false;
  result->log_clear = false;
  result->debug_enabled = false;



  result->x = 0.0;
  result->y = 0.0;
  result->z = 0.0;

  result->roll = v*rand()%360;
  result->pitch = v*rand()%360;
  result->yaw = v*rand()%360;

  struct sRGBSensor tmp;

  tmp.r = 0;
  tmp.g = 0;
  tmp.b = 0;
  tmp.w = 0;


  unsigned int i;
  for (i = 0; i < 4; i++)
    result->rgb_sensors.push_back(tmp);

  char str[21];

  for (i = 0; i < 20; i++)
  {
    if ((i%2) == 0)
      str[i] = '>';
    else
      str[i] = '\n';
  }
  str[20] = '\0';

  result->terminal = str;
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

void CBridgeInterface::add_to_log(int idx)
{
  struct sBridgeResult tmp = get(idx);
  if (tmp.id == 0)
    return;

  if (tmp.log_enabled == false)
    return;

  char file_name[256];
  sprintf(file_name,"log/robot_%x.log", tmp.id);

  FILE *f;

  if (tmp.log_clear == true)
  {
    tmp.log_clear = false;
    set(idx, tmp);
    f = fopen(file_name, "w");
  }
  else
    f = fopen(file_name, "a+");

  if (f == NULL)
  {
    printf("log file opening error\n");
    return;
  }

  //common information
  fprintf(f,"%u ", tmp.id);
  fprintf(f,"%u ", tmp.type);
  fprintf(f,"%u ", tmp.state);
  fprintf(f,"%u ", tmp.action);
  fprintf(f,"%f ", tmp.fitness);

  fprintf(f,"%u ", tmp.uptime);
  fprintf(f,"%lf ", tmp.time);

  //position
  fprintf(f,"%f ", tmp.x);
  fprintf(f,"%f ", tmp.y);
  fprintf(f,"%f ", tmp.z);

  fprintf(f,"%f ", tmp.roll);
  fprintf(f,"%f ", tmp.pitch);
  fprintf(f,"%f ", tmp.yaw);

  for (unsigned int i = 0; i < tmp.rgb_sensors.size(); i++)
  {
    fprintf(f,"%i ", tmp.rgb_sensors[i].r);
    fprintf(f,"%i ", tmp.rgb_sensors[i].g);
    fprintf(f,"%i ", tmp.rgb_sensors[i].b);
    fprintf(f,"%i ", tmp.rgb_sensors[i].w);
    fprintf(f,"%i ", tmp.rgb_sensors[i].d);
  }
  fprintf(f,"\n");

  fclose(f);
}
