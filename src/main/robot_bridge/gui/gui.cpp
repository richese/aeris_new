#include "gui.h"

#include <cstdio>

int g_selected_robot = -1;


CGUI::CGUI(CBridgeInterface *bridge_interface_)
{
  selected_robot = -1;
  application_thread = NULL;

  bridge_interface = bridge_interface_;
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
Fl::gl_visual(FL_RGB);

  main_window = new Fl_Window( window_width, window_height, "robot debug");
  main_window->begin();


  robots_list = new Fl_Select_Browser(10, 10, 200, window_height-20);
  robots_list->callback(callback_list_on_click_static, this);

  int space = 25;
  int x_ofs = 320;
  int y_ofs = 25;

  int frame_r = 120;
  int frame_g = 120;
  int frame_b = 120;



  basic_info = new Fl_Group(220, 30 , 300, 210, (char*)"Basic robot info");
  basic_info->box(FL_EMBOSSED_BOX );
  basic_info->color(fl_rgb_color(frame_r, frame_g, frame_b));

  robot_id = new Fl_Output(x_ofs, 10 + 0*space + y_ofs, 120, 20, (char*)"ID");
  robot_id->textsize(12);
  robot_id->value("N/A");


  robot_type = new Fl_Output(x_ofs, 35 + 1*space + y_ofs, 120, 20, (char*)"robot type");
  robot_type->textsize(12);
  robot_type->value("N/A");

  robot_state = new Fl_Output(x_ofs, 35 + 2*space+ y_ofs, 120, 20, (char*)"state");
  robot_state->textsize(12);
  robot_state->value("N/A");

  robot_action = new Fl_Output(x_ofs, 35 + 3*space+ y_ofs, 120, 20, (char*)"action");
  robot_action->textsize(12);
  robot_action->value("N/A");

  robot_fitness = new Fl_Output(x_ofs, 35 + 4*space+ y_ofs, 120, 20, (char*)"fitness");
  robot_fitness->textsize(12);
  robot_fitness->value("N/A");

  robot_uptime = new Fl_Output(x_ofs, 35 + 5*space+ y_ofs, 120, 20, (char*)"uptime");
  robot_uptime->textsize(12);
  robot_uptime->value("N/A");

  robot_note = new Fl_Output(x_ofs, 35 + 6*space+ y_ofs, 180, 20, (char*)"note");
  robot_note->textsize(12);
  robot_note->value("N/A");










  options = new Fl_Group(530, 30 , 280, 210, (char*)"Options");
  options->box(FL_EMBOSSED_BOX );
  options->color(fl_rgb_color(frame_r, frame_g, frame_b));




  y_ofs = 35;
  log_enabled = new Fl_Check_Button(535, 0*space + y_ofs, 30, 30, (char*)"&Log enable");
  log_enabled->callback(log_enabled_callback_static, this);
  log_enabled->type(FL_TOGGLE_BUTTON);
  main_window->add(log_enabled);

  debug_enabled = new Fl_Check_Button(535, 1*space + y_ofs, 30, 30, (char*)"&Debug enable");
  debug_enabled->callback(debug_enabled_callback_static, this);
  log_enabled->type(FL_TOGGLE_BUTTON);
  main_window->add(debug_enabled);




  sensors = new Fl_Group(220, 260 , 300, 190, (char*)"Sensors");
  sensors->box(FL_EMBOSSED_BOX );
  sensors->color(fl_rgb_color(frame_r, frame_g, frame_b));


  robot_position = new Fl_Output(x_ofs, 260 + 10, 180, 20, (char*)"position");
  robot_position->textsize(12);
  robot_position->value("N/A");

  robot_angles = new Fl_Output(x_ofs, 260 + 10 + 35, 180, 20, (char*)"angles");
  robot_angles->textsize(12);
  robot_angles->value("N/A");


  gl_window = new CGLWindow(530, 260, 280, 190, (char*)"NONE");

  main_window->show();
  main_window->end();
  gl_window->show();




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


void CGUI::redraw()
{
  Fl::lock();

  refresh();
  robot_values_refresh();

  Fl::unlock();
  Fl::redraw();
  Fl::awake();
}


void CGUI::refresh()
{
  printf("GUI : refresh called\n");


  robots_list->clear();

  unsigned int i;
  char str[1024];

  for (i = 0; i < bridge_interface->size(); i++)
  {
    struct sBridgeResult tmp = bridge_interface->get(i);

    sprintf(str,"%x", tmp.id);
    robots_list->add(str);
  }

  if (selected_robot >= 0)
  {
    robots_list->select(selected_robot+1);
  }

}




void CGUI::robot_values_refresh()
{
  printf("GUI : robot_values_refresh\n");

  char str[1024];


  struct sBridgeResult result = bridge_interface->get(selected_robot);

  sprintf(str,"%x", result.id);
  robot_id->value(str);

  sprintf(str,"%u", result.type);
  robot_type->value(str);

  sprintf(str,"%u", result.state);
  robot_state->value(str);

  sprintf(str,"%u", result.action);
  robot_action->value(str);

  sprintf(str,"%f", result.fitness);
  robot_fitness->value(str);

  sprintf(str,"%u [s]", result.uptime);
  robot_uptime->value(str);

  sprintf(str,"%s", result.note.c_str());
  robot_note->value(str);


  sprintf(str,"%6.3f %6.3f %6.3f", result.x, result.y, result.z);
  robot_position->value(str);

  sprintf(str,"%6.3f %6.3f %6.3f", result.roll, result.pitch, result.yaw);
  robot_angles->value(str);


  log_enabled->value(result.log_enabled);
  debug_enabled->value(result.debug_enabled);
}



void CGUI::callback_list_on_click_static(Fl_Widget* w, void* data)
{
   ((CGUI*)data)->callback_list_on_click(w);
}

void CGUI::callback_list_on_click(Fl_Widget* w)
{
  (void)w;

  printf("callback_list_on_click\n");

  Fl::lock();


  int tmp = robots_list->value();

  if (tmp > 0)
  {
    selected_robot = tmp - 1;
    robots_list->select(selected_robot + 1);
    printf("GUI : selected_robot %i\n", selected_robot);

    g_selected_robot = selected_robot;
  }

  Fl::unlock();

  robot_values_refresh();
}


void CGUI::log_enabled_callback_static(Fl_Widget* w, void* data)
{
  ((CGUI*)data)->log_enabled_callback(w);
}

void CGUI::log_enabled_callback(Fl_Widget* w)
{
  printf("log_enabled_callback\n");

  Fl::lock();

  struct sBridgeResult tmp = bridge_interface->get(selected_robot);

  tmp.log_enabled = !tmp.log_enabled;

  printf("SET RESULT WITH %i\n",bridge_interface->set(selected_robot, tmp));


  Fl::unlock();

  robot_values_refresh();
}

void CGUI::debug_enabled_callback_static(Fl_Widget* w, void* data)
{
  ((CGUI*)data)->debug_enabled_callback(w);
}

void CGUI::debug_enabled_callback(Fl_Widget* w)
{
  printf("debug_enabled_callback\n");

  Fl::lock();

  struct sBridgeResult tmp = bridge_interface->get(selected_robot);

  tmp.debug_enabled = !tmp.debug_enabled;

  bridge_interface->set(selected_robot, tmp);

  Fl::unlock();

  robot_values_refresh();
}
