#ifndef _CONFIGURE_H_
#define _CONFIGURE_H_




class CConfigure
{
  private:

    double width_pixel;
    double height_pixel;
    double depth_pixel;

    double width_cm;
    double height_cm;
    double depth_cm;

    double cm_size;

    char server_ip[16];
    int server_port;

  public:
    CConfigure();
    ~CConfigure();

    double get_width_pixel();
    double get_height_pixel();
    double get_depth_pixel();

    double get_width_cm();
    double get_height_cm();
    double get_depth_cm();

    double get_cm_size();

    char *get_server_ip();
    int get_server_port();
};



#endif
