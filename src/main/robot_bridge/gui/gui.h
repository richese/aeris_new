#ifndef _GUI_H_
#define _GUI_H_

#include <thread>
#include <mutex>
#include <vector>

#include "../bridge_interface.h"


#include <FL/Fl_Widget.H>
#include <FL/Fl.H>

#include <FL/Fl_Select_Browser.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Group.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Output.H>

#include <FL/Fl_Check_Button.H>


#include "gl_window.h"




class CGUI
{
  private:
    int selected_robot;
    CBridgeInterface *bridge_interface;

    std::thread *application_thread;


    Fl_Window  *main_window;

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


    Fl_Group *sensors;
    Fl_Output *robot_position;
    Fl_Output *robot_angles;


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

};


#endif
