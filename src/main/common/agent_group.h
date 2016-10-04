#ifndef _AGENT_GROUP_H_
#define _AGENT_GROUP_H_

#include <agent.h>
#include <rt_timer.h>



#include <boost/serialization/list.hpp>
#include <boost/serialization/string.hpp>
#include <boost/serialization/version.hpp>
#include <boost/serialization/split_member.hpp>

struct sAgentGroupInitStruct
{
  unsigned int count;
  bool random_positions;

  char server_ip[16];
  unsigned int server_port;

  unsigned int agent_type;
  double dt;
};


class CAgentGroup : public CRT_Timer
{
    friend class boost::serialization::access;

  protected:
    struct sAgentGroupInitStruct agent_group_init_struct;

    std::vector<struct sAgentInterface> agent_interface;
    std::vector<class CAgent*> agents;

  public:
    CAgentGroup(struct sAgentGroupInitStruct agent_group_init_struct);
    virtual ~CAgentGroup();

    virtual int main();

    unsigned int get_agents_count();
    int set_agent_struct(struct sAgentInterface *value);
    int get_agent_struct(struct sAgentInterface *value);
    struct sAgentInterface get_agent_struct_idx(unsigned int idx);


  public:
    /*
    template<class Archive> void agent_group_save(Archive & ar, const unsigned int version) const
    {
      ar & agent_interface;
    }

    template<class Archive> void agent_group_load(Archive & ar, const unsigned int version)
    {
        ar & agent_interface;
    }
    */

    BOOST_SERIALIZATION_SPLIT_MEMBER()

  protected:
    void rt_timer_callback();
    virtual int connect();
};


#endif
