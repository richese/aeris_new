#ifndef _AGENT_H_
#define _AGENT_H_

#include <cstdint>
#include <vector>

#include "agent_body.h"
#include "timing.h"
#include "types.h"


namespace ae
{


class Environment;


/** \brief Základná trieda, z ktorej dedia všetci agenti.
 *
 * Obsahuje definície funkcií potrebných na komunikáciu agenta s prostredím.
 *
 * Agenti môžu mať aj vlastné súkromné premenné ktoré vidia iba oni sami.
 */
class Agent
{
  protected:
    AgentInterface m_interface;

  public:
    /** \brief default constructor. Resents all values in agents interface. */
    Agent();

    virtual ~Agent();

    /* Gettery pre interface */
    uint64_t id() const { return m_interface.id; }
    uint32_t group_id() const { return (m_interface.id >> 32); }

    /** \brief Priradí agentovi id. Zavolá sa raz z AgentGroup. */
    virtual void init(uint64_t id);

    /** \brief Agent aktualizuje svoj stav na základe poskytnutého prostredia. */
    virtual void process(Environment &env) = 0;

    /** \brief Vráti typ agenta.
     *
     * Hodnotu vyčíta z konfigurácie pomocou toho, že agent vie ako sa volá.
     * Napr. vizualizačný agent vie, že v konfiguráčnom súbore sa musí volať
     * 'visualisation'.
     */
    virtual uint16_t assigned_type() const = 0;

    /** \brief Určuje, či agenti môžu sami odstrániť tento typ agenta z prostredia. */
    virtual bool remove_protection() const { return false; }

    /* Porovnávanie agentov na základe id. */
    bool operator ==(const Agent &b) const { return m_interface == b.m_interface; }
    bool operator !=(const Agent &b) const { return m_interface != b.m_interface; }
    bool operator  <(const Agent &b) const { return m_interface  < b.m_interface; }
    bool operator  >(const Agent &b) const { return m_interface  > b.m_interface; }

    /* Pretypovanie na bool vráti to, či má agent nenulové id. */
    operator bool() const { return m_interface; }

    /* Pretypovanie na AgentInterface vráti hodnotu agentovho interface. */
    operator AgentInterface() const { return m_interface; }
};


/** \brief Toto rozhranie poskytuje agentom informácie o ich okolitom prostredí.
 *
 * Agenti dokážu zistiť globálny stav prostredia, pridávať a odstraňovať agentov
 * tej istej grupy z prostredia.
 */
class Environment
{
  private:
    /** \brief Číslo grupy, ktorej je agent súčasťou. */
    const uint32_t m_this_group_id;

    /** \brief Aktuálny globálny stav prostredia. */
    const std::vector<AgentInterface> &m_global_state;

    /** \brief Zoznam žiadostí agentov o pridanie nových agentov do grupy. */
    std::vector<Agent*> m_add_agents;

    /** \brief Zoznam žiadostí agentov o odstránenie agentov tejto grupy. */
    std::vector<uint64_t> m_delete_agents;

  public:
    Environment(uint32_t group_id, std::vector<AgentInterface> &global_state);
    ~Environment();

    /** Vráti agentovi číslo grupy, ktorej je súčasťou. */
    uint32_t this_group_id() const { return m_this_group_id; }

    /** \brief Poskytne agentovi globálny stav prostredia.
     *
     * Ak si agent chce uchovať tento stav musí si urobiť jeho kópiu!
     * Po skončení metódy process bude toto pole dealokované.
     */
    const std::vector<AgentInterface>& global_state() const { return m_global_state; }

    /** Poskytne agentovi informácie o tele ľubovolného agenta v prostredí */
    const AgentBody* body_of_agent(const AgentInterface &agent);

    /** Požiada o zaradenie novej inštancie agenta do tejto grupy.
     *
     * Grupa preberá zodpovednosť za dealokáciu tohto agenta.
     */
    void add_agent(Agent *agent) { m_add_agents.push_back(agent); }

    /** Požiada o vylúčenie agenta s daným id z tejto grupy. */
    void del_agent(uint64_t id) { m_delete_agents.push_back(id); }


    const std::vector<Agent*>& add_agent_requests() const { return m_add_agents; }
    const std::vector<uint64_t>& del_agent_requests() const { return m_delete_agents; }
};


} /* namespace ae */


#endif /* _AGENT_H_ */
