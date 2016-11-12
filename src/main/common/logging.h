#ifndef _LOGGING_H_
#define _LOGGING_H_

#define ELPP_THREAD_SAFE
#define ELPP_FORCE_USE_STD_THREAD
#define ELPP_NO_DEFAULT_LOG_FILE

/* Uncomment to disable all performance tracking */
// #define ELPP_DISABLE_PERFORMANCE_TRACKING

/* Uncomment for bigger precision in performance tracking (default ms resolution) */
// #define ELPP_PERFORMANCE_MICROSECONDS


#include "../bundled/easylogging++.h"


void logging_init(const char *app_name, int argc, char *argv[]);


#endif /* _LOGGING_H_ */
