#include "gui.h"

#include <cstdio>

#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Group.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Output.H>

#include <FL/Fl_Check_Button.H>
#include <FL/gl.h>

Fl_Window  *main_window;
Fl_Select_Browser *modes_list;


Fl_Group *basic_info;

Fl_Output *robot_id;
Fl_Output *robot_type;
Fl_Output *robot_state;
Fl_Output *robot_fitness;



Fl_Group *options;
Fl_Check_Button *log_enabled;
Fl_Check_Button *debug_enabled;


int selected_item;

CGUI::CGUI()
{
  selected_item = -1;
  application_thread = NULL;
}


CGUI::~CGUI()
{
  if (application_thread != NULL)
  {
    application_thread->join();
    delete application_thread;
  }
}


void CGUI::run(void (*application_main_func)())
{

  int window_width = 820;
  int window_height = (9*window_width)/16;

  XInitThreads();
  main_window = new Fl_Window( window_width, window_height, "mode select app");
  main_window->begin();

  modes_list = new Fl_Select_Browser(10, 10, 200, window_height-20);
  modes_list->callback(callback_list_on_click_static);


  modes_list = new Fl_Select_Browser(10, 10, 200, window_height-20);

  int space = 25;
  int x_ofs = 320;
  int y_ofs = 25;
  Fl_Color color;



  basic_info = new Fl_Group(220, 30 , 300, 150, (char*)"Basic info");
  basic_info->box(FL_EMBOSSED_BOX );
  color = fl_rgb_color(80, 80, 80);
  basic_info->color(color);

  robot_id = new Fl_Output(x_ofs, 10 + 0*space + y_ofs, 100, 20, (char*)"Robot ID");
  robot_id->textsize(12);
  robot_id->value("N/A");


  robot_type = new Fl_Output(x_ofs, 35 + 1*space + y_ofs, 100, 20, (char*)"Robot type");
  robot_type->textsize(12);
  robot_type->value("N/A");

  robot_state = new Fl_Output(x_ofs, 35 + 2*space+ y_ofs, 100, 20, (char*)"Robot State");
  robot_state->textsize(12);
  robot_state->value("N/A");

  robot_fitness = new Fl_Output(x_ofs, 35 + 3*space+ y_ofs, 100, 20, (char*)"Robot fitness");
  robot_fitness->textsize(12);
  robot_fitness->value("N/A");



  options = new Fl_Group(510, 30 , 300, 150, (char*)"Options");
  options->box(FL_EMBOSSED_BOX );
  color = fl_rgb_color(80, 80, 80);
  options->color(color);


  y_ofs = 35;
  log_enabled = new Fl_Check_Button(520, 0*space + y_ofs, 30, 30, (char*)"Log enable");
  debug_enabled = new Fl_Check_Button(520, 1*space + y_ofs, 30, 30, (char*)"Debug enable");

  main_window->end();
  main_window->show();

  // Fl::run();
  Fl::lock();

  if (application_main_func != NULL)
  if (application_thread == NULL)
  {
    printf("GUI : starting application thread\n");
    application_thread = new std::thread(application_main_func);
  }

  while (Fl::wait() > 0)
  {
   if (Fl::thread_message())
   {

   }
  }
}

void CGUI::refresh(std::vector<struct sModeResult> mode_result)
{
//  printf("GUI : refresh called\n");

  Fl::lock();

  modes_list->clear();

  unsigned int i;
  for (i = 0; i < mode_result.size(); i++)
  {
//    printf("MODE NAME : %s \n", mode_result[i].mode_name.c_str());
    modes_list->add(mode_result[i].mode_name.c_str());
  }

  if (selected_item >= 0)
  {
    modes_list->select(selected_item+1);
  }

  Fl::unlock();
}

int CGUI::get_mode()
{
  return selected_item;
}



void CGUI::callback_list_on_click_static(Fl_Widget* w, void* data)
{
   ((CGUI*)data)->callback_list_on_click(w);
}

void CGUI::callback_list_on_click(Fl_Widget* w)
{
  (void)w;

//  printf("on click\n");

  Fl::lock();

  int tmp = modes_list->value();

  if (tmp > 0)
  {
    selected_item = tmp - 1;
    modes_list->select(selected_item + 1);
//    printf("GUI : selected mode %i\n", selected_item);
  }

  Fl::unlock();
}
