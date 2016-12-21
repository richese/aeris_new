#include "common/agent.h"  // pre ae::Agent, ae::Environment
#include "common/timing.h" // pre ae::time::sleep_for, ae::time::milliseconds
#include "common/logging.h" // pre LOG()

#include "example_agent.h"


/** \brief Napíše do logu, že  bola zavolaná táto funkcia a čaká 5 ms. */
void ExampleAgent::process(ae::Environment &env)
{
  (void)env;
  LOG(INFO) << "ExampleAgent process()";
  ae::time::sleep_for(ae::time::milliseconds(5));
}
