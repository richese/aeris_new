#include <cstdio>

#include <fcntl.h>
#include <signal.h>
#include <termios.h>
#include <unistd.h>

#include "signals.h"


#define EXIT_SIGNAL_REGISTERED  (0x01)
#define EXIT_SIGNAL_RECEIVED    (0x02)


namespace {


int l_exit_ctl = 0x00;


int kbhit(void)
{
  struct termios oldt, newt;
  int ch;
  int oldf;

  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
  fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);

  ch = getchar();

  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  fcntl(STDIN_FILENO, F_SETFL, oldf);

  if(ch != EOF)
  {
    ungetc(ch, stdin);
    return 1;
  }

  return 0;
}


int getch()
{
	if (kbhit())
	{
    return getchar();
  }
  else
  {
    return -1;
  }
}


void exit_signal_handler(int signo)
{
  if (signo == ae::signal::kExitSignal1 || signo == ae::signal::kExitSignal2)
  {
    l_exit_ctl |= EXIT_SIGNAL_RECEIVED;
  }
}


void register_exit_signals()
{
  if (!(l_exit_ctl & EXIT_SIGNAL_REGISTERED))
  {
    signal(ae::signal::kExitSignal1, exit_signal_handler);
    signal(ae::signal::kExitSignal2, exit_signal_handler);
    l_exit_ctl |= EXIT_SIGNAL_REGISTERED;
  }
}


} /* namespace */


bool ae::signal::exit()
{
  register_exit_signals();

  if ((l_exit_ctl & EXIT_SIGNAL_RECEIVED) != 0 || getch() == kExitKeySym)
  {
    l_exit_ctl &= ~(EXIT_SIGNAL_RECEIVED);
    return true;
  }
  else
  {
    return false;
  }
}
