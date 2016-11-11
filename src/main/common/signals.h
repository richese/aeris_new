#ifndef _GETCH_H_
#define _GETCH_H_

/** TODO: Premenuj getch.{cpp,h} na niečo výstižnejšie */

#define EXIT_SIGNAL_REGISTERED  (0x01)
#define EXIT_SIGNAL_RECEIVED    (0x02)

#define EXIT_KEY_KEYSYM         (27) // ESC key


bool received_exit_signal();


#endif
