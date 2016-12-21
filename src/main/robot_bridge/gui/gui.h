#ifndef _GUI_H_
#define _GUI_H_

#include <thread>
#include <mutex>
#include <vector>

#include <FL/Fl_Widget.H>
#include <FL/Fl_Select_Browser.H>


struct sModeResult
{
  unsigned int state;
  std::string mode_name;
};


class CGUI
{
  private:
    std::thread *application_thread;


  public:
    CGUI();
    virtual ~CGUI();

    void run(void (*application_main_func)() = NULL);
    void refresh(std::vector<struct sModeResult> mode_result);

    int get_mode();

  protected:

    static void callback_list_on_click_static(Fl_Widget* w, void* data);
    void callback_list_on_click(Fl_Widget* w);
};


#endif
