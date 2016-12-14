#include "uniqueid.h"


#define UID_BASE_ADR   ((unsigned int)(0x1FFFF7AC))

CUniqueID::CUniqueID()
{

}

CUniqueID::~CUniqueID()
{

}

unsigned int CUniqueID::get_unique_id()
{
  unsigned int i, result = 0;

  for (i = 0; i < 3; i++)
    result+= (result<<16) + (*((unsigned int*)(UID_BASE_ADR + (i*4))));

  return result;
}
