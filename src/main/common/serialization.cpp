#include "serialization.h"

#include <stdlib.h>
#include <string.h>

CSerializiation::CSerializiation()
{
  serialized = NULL;
  serialized_size= 0;
}


CSerializiation::~CSerializiation()
{
  if (serialized != NULL)
  {
    free(serialized);
    serialized = NULL;
    serialized_size= 0;
  }
}

void CSerializiation::serialization_add(void *value, unsigned int size)
{
  serialized = (char*) realloc (serialized, size);
  serialized_size+= size;
  memcpy(serialized, value, size);
}

char* CSerializiation::serialization_get()
{
  return serialized;
}

unsigned int CSerializiation::serialization_get_size()
{
  return serialized_size;
}
