#ifndef _GUI_H_
#define _GUI_H_

#include <thread>
#include <mutex>
#include <vector>

#include "../bridge_interface.h"
#include "../../common/common.h"



#include <FL/Fl_Widget.H>
#include <FL/Fl.H>
#include <FL/Fl_Tabs.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Select_Browser.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Group.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Output.H>

#include <FL/Fl_Check_Button.H>
#include <FL/Fl_Chart.H>
#include <FL/Fl_Multiline_Output.H>

#include "gl_window.h"




class CGUI
{
  private:
    int selected_robot;
    CBridgeInterface *bridge_interface;

    std::thread *application_thread;


    Fl_Window  *main_window;

    Fl_Tabs *tabs;
    Fl_Group *basic_group;

    Fl_Select_Browser *robots_list;

    Fl_Group *basic_info;

    Fl_Output *robot_id;
    Fl_Output *robot_type;
    Fl_Output *robot_state;
    Fl_Output *robot_action;
    Fl_Output *robot_fitness;
    Fl_Output *robot_uptime;
    Fl_Output *robot_note;



    Fl_Group *options;
    Fl_Check_Button *log_enabled;
    Fl_Check_Button *debug_enabled;
    Fl_Button *clear_log;


    Fl_Group *sensors;
    Fl_Output *robot_position;
    Fl_Output *robot_angles;

    std::vector<Fl_Output*> rgb;


    Fl_Multiline_Output *terminal;

    Fl_Chart *fitness_chart;
    Fl_Chart *summary_fitness_chart;

    Fl_Chart *x_position_chart;
    Fl_Chart *y_position_chart;
    Fl_Chart *z_position_chart;

    Fl_Chart *roll_chart;
    Fl_Chart *pitch_chart;
    Fl_Chart *yaw_chart;


    CGLWindow *gl_window;

  public:
    CGUI(CBridgeInterface *bridge_interface_);
    virtual ~CGUI();

    void run(void (*application_main_func)() = NULL);
    void redraw();

  protected:

    void refresh();
    void robot_values_refresh();


    static void callback_list_on_click_static(Fl_Widget* w, void* data);
    void callback_list_on_click(Fl_Widget* w);


    static void log_enabled_callback_static(Fl_Widget* w, void* data);
    void log_enabled_callback(Fl_Widget* w);

    static void debug_enabled_callback_static(Fl_Widget* w, void* data);
    void debug_enabled_callback(Fl_Widget* w);

    static void clear_log_callback_static(Fl_Widget* w, void* data);
    void clear_log_callback(Fl_Widget* w);

    static void tabs_callback_static(Fl_Widget* w, void* data);
    void tabs_callback(Fl_Widget* w);
};


#endif
