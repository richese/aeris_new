#include <cstdio>

#include <fcntl.h>
#include <signal.h>
#include <termios.h>
#include <unistd.h>

#include "signals.h"


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
  if (signo == SIGINT || signo == SIGTERM)
  {
    l_exit_ctl |= EXIT_SIGNAL_RECEIVED;
  }
}

void register_exit_signals()
{
  if (!(l_exit_ctl & EXIT_SIGNAL_REGISTERED))
  {
    signal(SIGINT, exit_signal_handler);
    signal(SIGTERM, exit_signal_handler);
    l_exit_ctl |= EXIT_SIGNAL_REGISTERED;
  }
}


} /* namespace */


bool received_exit_signal()
{
  register_exit_signals();

  return (l_exit_ctl & EXIT_SIGNAL_RECEIVED) != 0 || getch() == EXIT_KEY_KEYSYM;
}
