#ifndef _SIGNALS_H_
#define _SIGNALS_H_

#include <signal.h>


namespace ae
{
namespace signal
{


const int kExitKeySym = 27;

const int kExitSignal1 = SIGTERM;
const int kExitSignal2 = SIGINT;


/** Vráti true ak bola stlačená klávesa ESC alebo bol prijatý jeden zo signálov
 * SIGTERM alebo SIGINT.
 */
bool exit();


} /* namespace signal */
} /* namespace ae */


#endif /* _SIGNALS_H_ */
