#ifndef _RGB_H_
#define _RGB_H_

#include "rgb_i2c.h"

struct sRGBResult
{
  int16_t r[RGB_SENSORS_COUNT], g[RGB_SENSORS_COUNT], b[RGB_SENSORS_COUNT];
  int16_t ambient[RGB_SENSORS_COUNT], proximity[RGB_SENSORS_COUNT];
  int16_t r_normalised[RGB_SENSORS_COUNT], g_normalised[RGB_SENSORS_COUNT], b_normalised[RGB_SENSORS_COUNT];
};

class CRGB: public CRGB_I2C
{
  private:
    unsigned char rgb_raw[RGB_SENSORS_COUNT];
    struct sRGBResult rgb_result, rgb_calibration;

  public:
    CRGB();
    ~CRGB();

    int32_t rgb_init();

    void rgb_read(unsigned char calibration = 0);
    struct sRGBResult *get_rgb_result();
};

#endif
