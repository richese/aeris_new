#ifndef _LOGGING_H_
#define _LOGGING_H_

/* V projekte includovať vždy len logging.h a nie priamo bundled/easylogging++.h
 * aby boli všade definované tieto makrá, čo nastavujú niektoré veci vo vnútri.
 */
#define ELPP_THREAD_SAFE
#define ELPP_FORCE_USE_STD_THREAD
#define ELPP_NO_DEFAULT_LOG_FILE

/* Uncomment to disable all performance tracking */
// #define ELPP_DISABLE_PERFORMANCE_TRACKING

/* Uncomment for bigger precision in performance tracking (default ms resolution) */
// #define ELPP_PERFORMANCE_MICROSECONDS


#include "bundled/easylogging++.h"


#endif /* _LOGGING_H_ */
