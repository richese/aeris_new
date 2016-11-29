#ifndef _VECTOR_H_
#define _VECTOR_H_

template <class t_type, unsigned int _size> class Vector
{
  public:
    t_type arr[_size];

  public:
    Vector()
    {

    }

    ~Vector()
    {

    }

    //acess to vector using v[idx] = value
    t_type &operator[](unsigned int idx)
    {
      return arr[idx];
    }

    //@return vector size
    unsigned int size()
    {
      return _size;
    }

    //shift existing vector elements and store new value
    //shift : v[n] = v[n-1]
    //store : v[0] = value
    //@param value
    void add(t_type value)
    {
      unsigned int i;
      for (i = (_size-1); i > 0; i--)
        arr[i] = arr[i-1];
      arr[0] = value;
    }
};


#endif
