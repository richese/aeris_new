#include "gui.h"

#include <cstdio>
#include <math.h>

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
  int window_height = 700;

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









  tabs = new Fl_Tabs(220, 10, window_width-230, window_height-20);
  {
    //basic info tab
    basic_group = new Fl_Group(10,35,window_width-230-20,window_height-45,"Main");
    {
        space = 25;
        x_ofs = 220;
        y_ofs = 10;

        basic_info = new Fl_Group(x_ofs + 10, y_ofs + 50, 300, 210, (char*)"Basic robot info");
        basic_info->box(FL_EMBOSSED_BOX );
        basic_info->color(fl_rgb_color(frame_r, frame_g, frame_b));

        robot_id = new Fl_Output(x_ofs + 100, y_ofs + 60 + 0*space, 120, 20, (char*)"ID");
        robot_id->textsize(12);
        robot_id->value("N/A");


        robot_type = new Fl_Output(x_ofs + 100, y_ofs + 60 + 10 + 1*space, 120, 20, (char*)"robot type");
        robot_type->textsize(12);
        robot_type->value("N/A");

        robot_state = new Fl_Output(x_ofs + 100, y_ofs + 60 + 10 + 2*space, 120, 20, (char*)"state");
        robot_state->textsize(12);
        robot_state->value("N/A");

        robot_action = new Fl_Output(x_ofs + 100, y_ofs + 60 + 10 + 3*space, 120, 20, (char*)"action");
        robot_action->textsize(12);
        robot_action->value("N/A");

        robot_fitness = new Fl_Output(x_ofs + 100, y_ofs + 60 + 10 + 4*space, 120, 20, (char*)"fitness");
        robot_fitness->textsize(12);
        robot_fitness->value("N/A");

        robot_uptime = new Fl_Output(x_ofs + 100, y_ofs + 60 + 10 + 5*space, 120, 20, (char*)"uptime");
        robot_uptime->textsize(12);
        robot_uptime->value("N/A");

        robot_note = new Fl_Output(x_ofs + 100, y_ofs + 60 + 10 + 6*space, 180, 20, (char*)"note");
        robot_note->textsize(12);
        robot_note->value("N/A");




        x_ofs = 530;
        y_ofs = 10;


        options = new Fl_Group(x_ofs + 10, y_ofs + 50 , 260, 210, (char*)"Options");
        options->box(FL_EMBOSSED_BOX );
        options->color(fl_rgb_color(frame_r, frame_g, frame_b));



        log_enabled = new Fl_Check_Button(x_ofs + 20, y_ofs + 60 + 0*space, 30, 30, (char*)"Log enable");
        log_enabled->callback(log_enabled_callback_static, this);
        log_enabled->type(FL_TOGGLE_BUTTON);
        basic_group->add(log_enabled);

        debug_enabled = new Fl_Check_Button(x_ofs + 20, y_ofs + 60 + 1*space, 30, 30, (char*)"Debug enable");
        debug_enabled->callback(debug_enabled_callback_static, this);
        log_enabled->type(FL_TOGGLE_BUTTON);
        basic_group->add(debug_enabled);

        clear_log = new Fl_Button(x_ofs + 20, y_ofs + 60 + 5*space, 120, 40, (char*)"Clear log");
        clear_log->callback(clear_log_callback_static, this);
        basic_group->add(clear_log);

        x_ofs = 220;
        y_ofs = 250;

        sensors = new Fl_Group(x_ofs + 10, y_ofs + 50, 300, 210, (char*)"Sensors");
        sensors->box(FL_EMBOSSED_BOX );
        sensors->color(fl_rgb_color(frame_r, frame_g, frame_b));


        robot_position = new Fl_Output(x_ofs + 100, y_ofs + 60 + 0*space, 180, 20, (char*)"position");
        robot_position->textsize(12);
        robot_position->value("N/A");

        robot_angles = new Fl_Output(x_ofs + 100, y_ofs + 60 + 1*space, 180, 20, (char*)"angles");
        robot_angles->textsize(12);
        robot_angles->value("N/A");

        for (unsigned int i = 0; i < 4; i++)
        {
          std::string *str = new std::string("RGBWD[");


          *str+=  std::to_string(i);
          *str+= "]";

          rgb.push_back(new Fl_Output(x_ofs + 100, y_ofs + 60 + (i+3)*space, 180, 20, str->c_str()));
          rgb[i]->textsize(12);
          rgb[i]->value("N/A");
        }

        x_ofs = 540;
        y_ofs = 250;

        gl_window = new CGLWindow(x_ofs, y_ofs + 50, 260, 210, (char*)"NONE");
        basic_group->add(gl_window);


        x_ofs = 220;
        y_ofs = 520;

        terminal = new Fl_Multiline_Output(x_ofs + 10, y_ofs, window_width-230-20, 150);
        std::string value = ">\n>\n>\n>\n>\n>\n>\n>";
        terminal->value(value.c_str());
        basic_group->add(terminal);
    }

    basic_group->end();

    Fl_Group *score_group = new Fl_Group(10,35,window_width-230-20,window_height-45,"Score");
    {
        x_ofs = 220;
        y_ofs = 10;
        space = 150;


        fitness_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 0*space, 570, 120, (char*)"fitness value");
        fitness_chart->type(FL_LINE_CHART);

        fitness_chart->bounds(-1.0, 1.0);
        fitness_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


        for (unsigned int i = 0; i < 100; i++)
        {
             float value = 0.0;
             static char value_str[20];
             sprintf(value_str, "%6.3f", value);

             if ((i%10) == 0)
              fitness_chart->add(value, value_str, FL_GREEN);
            else
              fitness_chart->add(value, NULL, FL_GREEN);
        }

        score_group->add(fitness_chart);




        summary_fitness_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 1*space, 570, 120, (char*)"summary fitness value");
        summary_fitness_chart->type(FL_LINE_CHART);

        summary_fitness_chart->bounds(-1.0, 1.0);
        summary_fitness_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


        for (unsigned int i = 0; i < 100; i++)
        {
             float value = 0.0;
             static char value_str[20];
             sprintf(value_str, "%6.3f", value);

             if ((i%10) == 0)
              summary_fitness_chart->add(value, value_str, FL_GREEN);
            else
              summary_fitness_chart->add(value, NULL, FL_GREEN);
        }

        score_group->add(summary_fitness_chart);


    }
    score_group->end();


    // charts tab
    Fl_Group *position_charts_group = new Fl_Group(10,35,window_width-230-30,window_height-35,"Position");
    {
      x_ofs = 220;
      y_ofs = 10;
      int height = 75;
      space = 1.35*height;


      x_position_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 0*space, 570, height, (char*)"x position");
      x_position_chart->type(FL_LINE_CHART);

      x_position_chart->bounds(-1.0, 1.0);
      x_position_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


      for (unsigned int i = 0; i < 100; i++)
      {
           float value = 0.0;
           static char value_str[20];
           sprintf(value_str, "%6.3f", value);

           if ((i%10) == 0)
            x_position_chart->add(value, value_str, FL_GREEN);
          else
            x_position_chart->add(value, NULL, FL_GREEN);
      }

      position_charts_group->add(x_position_chart);


      y_position_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 1*space, 570, height, (char*)"y position");
      y_position_chart->type(FL_LINE_CHART);

      y_position_chart->bounds(-1.0, 1.0);
      y_position_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


      for (unsigned int i = 0; i < 100; i++)
      {
           float value = 0.0;
           static char value_str[20];
           sprintf(value_str, "%6.3f", value);

           if ((i%10) == 0)
            y_position_chart->add(value, value_str, FL_GREEN);
          else
            y_position_chart->add(value, NULL, FL_GREEN);
      }

      position_charts_group->add(y_position_chart);


      z_position_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 2*space, 570, height, (char*)"z position");
      z_position_chart->type(FL_LINE_CHART);

      z_position_chart->bounds(-1.0, 1.0);
      z_position_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


      for (unsigned int i = 0; i < 100; i++)
      {
           float value = 0.0;
           static char value_str[20];
           sprintf(value_str, "%6.3f", value);

           if ((i%10) == 0)
            z_position_chart->add(value, value_str, FL_GREEN);
          else
            z_position_chart->add(value, NULL, FL_GREEN);
      }

      position_charts_group->add(z_position_chart);



      roll_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 3*space, 570, height, (char*)"roll");
      roll_chart->type(FL_LINE_CHART);

      roll_chart->bounds(0.0, 360.0);
      roll_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


      for (unsigned int i = 0; i < 100; i++)
      {
           float value = 0.0;
           static char value_str[20];
           sprintf(value_str, "%6.3f", value);

           if ((i%10) == 0)
            roll_chart->add(value, value_str, FL_GREEN);
          else
            roll_chart->add(value, NULL, FL_GREEN);
      }

      position_charts_group->add(roll_chart);

      pitch_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 4*space, 570, height, (char*)"pitch");
      pitch_chart->type(FL_LINE_CHART);

      pitch_chart->bounds(0.0, 360.0);
      pitch_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


      for (unsigned int i = 0; i < 100; i++)
      {
           float value = 0.0;
           static char value_str[20];
           sprintf(value_str, "%6.3f", value);

           if ((i%10) == 0)
            pitch_chart->add(value, value_str, FL_GREEN);
          else
            pitch_chart->add(value, NULL, FL_GREEN);
      }

      position_charts_group->add(pitch_chart);


      yaw_chart = new Fl_Chart(x_ofs+10, y_ofs+50 + 5*space, 570, height, (char*)"yaw");
      yaw_chart->type(FL_LINE_CHART);

      yaw_chart->bounds(0.0, 360.0);
      yaw_chart->color(fl_rgb_color(frame_r, frame_g, frame_b));


      for (unsigned int i = 0; i < 100; i++)
      {
           float value = 0.0;
           static char value_str[20];
           sprintf(value_str, "%6.3f", value);

           if ((i%10) == 0)
            yaw_chart->add(value, value_str, FL_GREEN);
          else
            yaw_chart->add(value, NULL, FL_GREEN);
      }

      position_charts_group->add(yaw_chart);
    }

    position_charts_group->end();

    Fl_Group *debug_group = new Fl_Group(10,35,window_width-230-40,window_height-45,"Debug");
    {

    }

    debug_group->end();

  }
  tabs->end();

  tabs->callback(tabs_callback_static, this);
  main_window->add(tabs);


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

    sprintf(str,"%8.8x", tmp.id);
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

  sprintf(str,"%8.8x", result.id);
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

  sprintf(str,"%6.1f %6.1f %6.1f", result.roll, result.pitch, result.yaw);
  robot_angles->value(str);


  unsigned int i;


  for (i = 0; i < rgb.size(); i++)
  {
    sprintf(str,"%5i %5i %5i %5i %5i", result.rgb_sensors[i].r, result.rgb_sensors[i].g, result.rgb_sensors[i].b, result.rgb_sensors[i].w , result.rgb_sensors[i].d);
    rgb[i]->value(str);
  }

  terminal->value(result.terminal.c_str());

  log_enabled->value(result.log_enabled);
  debug_enabled->value(result.debug_enabled);



  if (fitness_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%fitness_chart->size();

    float value = result.fitness;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      fitness_chart->replace(idx, value, value_str, FL_GREEN);
    else
      fitness_chart->replace(idx, value, NULL, FL_GREEN);
  }


  if (summary_fitness_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%fitness_chart->size();

    float value = 0.0;
    float count = 0.0;

    for (i = 0; i < bridge_interface->size(); i++)
    {
      float tmp = bridge_interface->get(i).fitness;
      value+= tmp;
      count+= 1.0;
    }

    if (count > 0.0)
      value = value/count;


    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      summary_fitness_chart->replace(idx, value, value_str, FL_GREEN);
    else
      summary_fitness_chart->replace(idx, value, NULL, FL_GREEN);
  }

  if (x_position_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%x_position_chart->size();

    float value = result.x;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      x_position_chart->replace(idx, value, value_str, FL_GREEN);
    else
      x_position_chart->replace(idx, value, NULL, FL_GREEN);
  }

  if (y_position_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%y_position_chart->size();

    float value = result.y;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      y_position_chart->replace(idx, value, value_str, FL_GREEN);
    else
      y_position_chart->replace(idx, value, NULL, FL_GREEN);
  }

  if (z_position_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%z_position_chart->size();

    float value = result.z;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      z_position_chart->replace(idx, value, value_str, FL_GREEN);
    else
      z_position_chart->replace(idx, value, NULL, FL_GREEN);
  }



  if (z_position_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%z_position_chart->size();

    float value = result.z;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      z_position_chart->replace(idx, value, value_str, FL_GREEN);
    else
      z_position_chart->replace(idx, value, NULL, FL_GREEN);
  }

  if (roll_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%roll_chart->size();

    float value = ((int)result.roll)%360;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      roll_chart->replace(idx, value, value_str, FL_GREEN);
    else
      roll_chart->replace(idx, value, NULL, FL_GREEN);
  }

  if (pitch_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%pitch_chart->size();

    float value = ((int)result.pitch)%360;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      pitch_chart->replace(idx, value, value_str, FL_GREEN);
    else
      pitch_chart->replace(idx, value, NULL, FL_GREEN);
  }

  if (yaw_chart->size() > 0)
  {
    unsigned int idx = get_s_time()%yaw_chart->size();

    float value = ((int)result.yaw)%360;
    char value_str[20];
    sprintf(value_str, "%6.3f", value);

    if ((idx%10) == 0)
      yaw_chart->replace(idx, value, value_str, FL_GREEN);
    else
      yaw_chart->replace(idx, value, NULL, FL_GREEN);
  }
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

void CGUI::clear_log_callback_static(Fl_Widget* w, void* data)
{
  ((CGUI*)data)->clear_log_callback(w);
}

void CGUI::clear_log_callback(Fl_Widget* w)
{
  Fl::lock();

  struct sBridgeResult tmp = bridge_interface->get(selected_robot);
  if (tmp.log_enabled == true)
    tmp.log_clear = true;
  bridge_interface->set(selected_robot, tmp);

  Fl::unlock();
}


void CGUI::tabs_callback_static(Fl_Widget* w, void* data)
{
  ((CGUI*)data)->tabs_callback(w);
}

void CGUI::tabs_callback(Fl_Widget* w)
{
  Fl::lock();

  if (tabs->value() == basic_group)
  {
    gl_window->show();
  }
  else
    gl_window->hide();
  Fl::unlock();
}
