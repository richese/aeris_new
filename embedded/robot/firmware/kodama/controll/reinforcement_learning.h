#ifndef _REINFORCEMENT_LEARNING_H_
#define _REINFORCEMENT_LEARNING_H_

#include "associative_memory.h"

template <unsigned int state_size, unsigned int actions_count, unsigned int hard_locations_count> class ReinforcementLearning
{
  protected:
    unsigned int action_prev, action;

    MathVector<state_size> state, state_prev;
    AssociativeMemory<state_size, actions_count, hard_locations_count> q;

    MathVector<actions_count> q_values;

  public:
    ReinforcementLearning()
    {

    }

    ~ReinforcementLearning()
    {

    }

    void init()
    {
      q.init();

      action_prev = 0;
      action = 0;

      state.init();
      state_prev.init();
      q_values.init();
    }


    unsigned int process(MathVector<state_size> &state_)
    {
      state_prev = state;
      state = state_;

      q.load(state, q_values);    //obtain q-values for current state

      action_prev = action;
      action = select_action();   //use q-values to select action

      return action;
    }

    void process_learning(float reward)
    {
      learn(state, action, state_prev, action_prev, reward);
    }

  protected:

    unsigned int select_action()
    {
      unsigned int action_res = 0;
      if ((math.rand()%100) < 20)
      {
        //choose random action
        action_res = math.rand()%actions_count;
      }
      else
      {
        //choose best action
        action_res = 0;
        unsigned int i;
        for (i = 0; i < q_values.size(); i++)
          if (q_values[i] > q_values[action_res])
            action_res = i;
      }

      return action_res;
    }

  private:

    void learn(MathVector<state_size> &state_now_, unsigned int action_now_,
                MathVector<state_size> &state_prev_, unsigned int action_prev_,
                float reward)
    {
      float gamma = 0.9;

      q.load(state_now_, q_values);
      float q_now = q_values[action_now_];


      unsigned int i;
      for (i = 0; i < q_values.size(); i++)
        if (q_now < q_values[i])
          q_now = q_values[i];


      q.load(state_prev_, q_values);

      q_values[action_prev_] = reward + gamma*q_now;
      q.save(state_prev_, q_values);
    }
};



#endif
