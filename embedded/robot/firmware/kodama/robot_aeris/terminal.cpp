#include "terminal.h"

#include "stdarg.h"
#include <device.h>


#define UART_BAUD_RATE          115200
#define USART                   USART1
#define UART_RX_BUFFER_SIZE     16

volatile uint32_t g_uart_rd_ptr, g_uart_wr_ptr;
volatile uint8_t g_uart_rx_buffer[UART_RX_BUFFER_SIZE];


CTerminal::CTerminal()
{

}

int32_t CTerminal::terminal_init()
{
  unsigned int i;

  g_uart_wr_ptr = 0;
  g_uart_rd_ptr = 0;

  for (i = 0; i < UART_RX_BUFFER_SIZE; i++)
    g_uart_rx_buffer[i] = '\0';

    GPIO_InitTypeDef  GPIO_InitStructure;
  	USART_InitTypeDef USART_InitStructure;

    /* Enable GPIO clock */
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

    /* Enable USART clock */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);


     //Connect USART pins to A
    	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9 | GPIO_Pin_10;
    	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    	GPIO_Init(GPIOA, &GPIO_InitStructure);


    	GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_7);
    	GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_7);

    USART_InitStructure.USART_BaudRate = UART_BAUD_RATE*1;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;

    USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

    USART_Init(USART, &USART_InitStructure);

    USART_Cmd(USART, ENABLE);

    NVIC_InitTypeDef NVIC_InitStructure;      // this is used to configure the NVIC (nested vector interrupt controller)
    USART_ITConfig(USART, USART_IT_RXNE, ENABLE); // enable the USART2 receive interrupt

        NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;             // we want to configure the USART1 interrupts
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;         // this sets the priority group of the USART1 interrupts
        NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;        // this sets the subpriority inside the group
        NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;           // the USART2 interrupts are globally enabled
        NVIC_Init(&NVIC_InitStructure);                       // the properties are passed to the NVIC_Init function which takes care of the low level stuff

        // finally this enables the complete USART2 peripheral
        USART_Cmd(USART, ENABLE);

  return 0;
}

CTerminal::~CTerminal()
{


}


#ifdef __cplusplus
extern "C" {
#endif

void USART1_IRQHandler(void)
{
  if (USART_GetITStatus(USART1, USART_IT_RXNE) != RESET) // Received character?
  {
    char rx =  USART_ReceiveData(USART1);

    g_uart_rx_buffer[g_uart_wr_ptr] = rx;
      g_uart_wr_ptr++;
    if (g_uart_wr_ptr >= UART_RX_BUFFER_SIZE)
      g_uart_wr_ptr = 0;
  }

  USART_ClearITPendingBit(USART1, USART_IT_RXNE);
}

#ifdef __cplusplus
}
#endif


void CTerminal::putchar(char c)
{
  while( !(USART->ISR & USART_FLAG_TXE) )
		__asm("nop");

	USART->TDR = c;
}

int CTerminal::getchar()
{
  int res;

	while( (res = ischar()) == 0xffff )
		__asm("nop");

  return res;
}

int CTerminal::ischar()
{
  int res = 0;

  if (g_uart_rd_ptr == g_uart_wr_ptr)
    res = 0xffff;
  else
  {
    res = g_uart_rx_buffer[g_uart_rd_ptr];

    g_uart_rd_ptr++;
    if (g_uart_rd_ptr >= UART_RX_BUFFER_SIZE)
      g_uart_rd_ptr = 0;
  }

  return res;
}


int CTerminal::puts(char *s)
{
  uint32_t ptr = 0;

	while (s[ptr]!='\0')
	{
		putchar(s[ptr]);
		ptr++;
	}

  return 1;
}



/*print signed int number*/
void CTerminal::puti(int32_t n)
{
	char flag = 0, s[12];
	uint32_t ptr;

	if (n < 0)
 	{
  		n = -n;
		flag = 1;
	}

	s[11] = '\0';
	ptr = 10;

	do
	{
    	s[ptr] = '0' + (n%10);
    	n/= 10;
    	ptr--;
	}
    while (n != 0);

	if (flag)
		s[ptr] = '-';
	else
		ptr++;

	puts(s + ptr);
}


/*print unsigned int number*/
void CTerminal::putui(uint32_t n)
{
	char s[12];
	uint32_t ptr;

	s[11] = '\0';
	ptr = 10;

	do
	{
    	s[ptr] = '0' + (n%10);
    	n/= 10;
    	ptr--;
	}
    while (n != 0);

	ptr++;
	puts(s + ptr);
}



/*print unsigned int as hex*/
void CTerminal::putx(uint32_t n)
{
	char s[12];
	int8_t tmp;
	uint32_t ptr;

	s[11] = '\0';
	ptr = 10;

	do
	{
    	tmp=n&0x0F;		/*modulo 16*/
    	if (tmp < 10)
     		s[ptr] = '0' + tmp;
    	else
     		s[ptr] = 'a' + tmp - 10;

    	n>>= 4;		/*div 16*/
    	ptr--;
   	}
    while (n != 0);

	ptr++;
 	puts(s + ptr);
}


void CTerminal::putf(float n, unsigned int decimal_places)
{
  unsigned int i, power = 1;
  for (i = 0; i < decimal_places; i++)
    power*= 10;

  int int_part = (int)n;
  int frac_part = (int)((n - int_part)*power);
  if (frac_part < 0)
    frac_part = -frac_part;

  puti(int_part);
  putchar('.');
  puti(frac_part);
}

void CTerminal::printf(const char *str, ...)
{
	va_list args;
	va_start(args, str);

  unsigned int s_ptr = 0;

	while (str[s_ptr] != '\0')			/*scan string*/
 	{
		if (str[s_ptr] != '%')
		{
			putchar(str[s_ptr]);			/*if no % print char*/
			s_ptr++;
   	}
		else
		{		/*switch %? argumet*/
	    	s_ptr++;

	    	switch (str[s_ptr])
	    	{
	     		case 'i': puti(va_arg(args, int)); break;
	     		case 'u': putui(va_arg(args, int)); break;
	     		case 'x': putx(va_arg(args, int)); break;
	     		case 'c': putchar(va_arg(args, int)); break;
	     		case 's': puts((char*)va_arg(args, int)); break;
	     		case '%': putchar('%'); break;
          case 'f': putf(va_arg(args, double), 3); break;
	    	}

			  s_ptr++;
	   }
	}

  va_end(args);
}

char* CTerminal::gets(char *s)
{
  return s;
}

void CTerminal::scanf(char *str, ...)
{
  (void)str;
}
