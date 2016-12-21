#ifndef _EXAMPLE_AGENT_H_
#define _EXAMPLE_AGENT_H_

#include <cstdint> // for integer types

#include "common/agent.h" // for ae::Agent, ae::Environment


class ExampleAgent : public ae::Agent
{
  public:
    ExampleAgent() {}
    ~ExampleAgent() {}

    void process(ae::Environment &env);

    uint16_t assigned_type() const { return 0; }

    bool remove_protection() const { return false; }
};


#endif /* _EXAMPLE_AGENT_H_ */
