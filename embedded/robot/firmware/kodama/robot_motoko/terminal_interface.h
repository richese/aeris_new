#ifndef _TERMINAL_INTERFACE_H_
#define _TERMINAL_INTERFACE_H_

class CTerminalInterface
{
  public:
    CTerminalInterface()
    {

    }

    ~CTerminalInterface()
    {

    }

    //initialize terminal
    //@return zero if sucess, negative if error
    int32_t terminal_init()
    {
      return 0;
    }

    //print char do stdout
    //@param c - char to be printed
    void putchar(char c)
    {
      (void)c;
    }

    //wait for char
    //@return received char
    int getchar()
    {
      return 0;
    }

    //@return char ascii code <0..255> if char presents in receive buffer,
    //else return 0xffff if thesere is no char in receive buffer
    int ischar()
    {
      return 0xffff;
    }

    //print zero terminated ('\0') string to stdout
    //@param s - printed string, zero terminated
    //@return 1 if sucess
    int puts(char *s)
    {
      (void)s;
      return 0;
    }
};

#endif
