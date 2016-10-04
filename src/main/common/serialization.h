#ifndef _SERIALZIATION_H_
#define _SERIALZIATION_H_


class CSerializiation
{
  private:
    char *serialized;
    unsigned int serialized_size;

  public:
    CSerializiation();
    ~CSerializiation();

    void serialization_add(void *value, unsigned int size);
    char* serialization_get();
    unsigned int serialization_get_size();
};


#endif
