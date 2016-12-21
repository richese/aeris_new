#include "gui.h"

#include <cstdio>

#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Button.H>
#include <unistd.h>
Fl_Window  *main_window;
Fl_Select_Browser *modes_list;
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

  int window_width = 220;
  int window_height = 400;

  XInitThreads();
  main_window = new Fl_Window( window_width, window_height, "mode select app");
  main_window->begin();

  modes_list = new Fl_Select_Browser(10, 10, 200, window_height-20);
  modes_list->callback(callback_list_on_click_static);

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
