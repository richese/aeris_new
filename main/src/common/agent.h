#ifndef _AGENT_H_
#define _AGENT_H_

#include <cstdint>
#include <vector>

#include "agent_body.h"
#include "timing.h"


using ae::time::agent_time_t;


namespace ae
{


class Environment;


struct sAgentPosition
{
  float x, y, z;
  float roll, pitch, yaw;
};


struct sColor
{
  float r, g, b;
};


/** \brief Štruktúra popisujúca stav agenta v prostredí.
 *
 * Takto agenti vidia všetkých ostatných agentov v prostredí.
 *
 * \var sAgentInterface::id
 *   Unikátny identifikátor agenta v prostredí.
 *   Hodnotu priraďuje AgentGroup pri registrácii agenta do prostredia
 *   agent ju nesmie meniť.
 *
 * \var sAgentInterface::type
 *   Identifikátor typu agenta podľa jeho úlohy.
 *
 * \var sAgentInterface::body
 *   Identifikátor typu tela agenta pre vizualizáciu a výpočet kolízii.
 *
 * \var sAgentInterface::timestamp
 *   Čas poslednej aktualizácie tohto agenta.
 *   Hodnota je absolútny čas v mikrosekundách od počiatku unixovej epochy.
 *   Preto je potrebné aby čas na všetkých strojoch bol synchronizovaný
 *   pomocou NTP protokolu.
 *
 * \var sAgentInterface::expires
 *   Absolútny čas, po ktorom možno agenta považovať za zombie.
 *   Hodnota <= 0 značí, že agent neexpiruje.
 *
 * \var sAgentInterface::position
 *   X, Y, Z koordináty agenta v prostredí. Koordináty sú v cm.
 *   Roll, Pitch, Yaw rotácia agneta v prostredí v ???.
 *   Veľkosť hracej plochy v cm určí konfiguračný súbor podľa rozlíšenia
 *   a uhlopriečky reálnej hracej plochy na LED paneli.
 *
 * \var sAgentInterface::color
 *   R, G, B komponenty farby robota vo vizualizácii avšak môže značiť aj stav
 *   agenta pre iných agentov.
 *   Hodnoty sú v rozsahu 0.0f až 1.0f.
 *
 * \var sAgentInterface::value
 *   Toto pole obsahuje ďalšie stavové informácie o agentovi.
 *   To ako sú tieto hodnoty interpretované (typ, hodnota) ja na agentoch.
 */
struct sAgentInterface
{
  uint64_t id;
  uint16_t type;
  uint16_t body;

  agent_time_t timestamp;
  agent_time_t expires;

  sAgentPosition position;
  sColor color;

  uint16_t value[4];


  operator bool() const { return id != 0; }

  /* Porovnávanie agentov na základe id. */
  bool operator ==(const sAgentInterface &b) const { return id == b.id; }
  bool operator !=(const sAgentInterface &b) const { return id != b.id; }
  bool operator  <(const sAgentInterface &b) const { return id  < b.id; }
  bool operator  >(const sAgentInterface &b) const { return id  > b.id; }
};


/** \brief Základná trieda, z ktorej dedia všetci agenti.
 *
 * Obsahuje definície funkcií potrebných na komunikáciu agenta s prostredím.
 *
 * Agenti môžu mať aj vlastné súkromné premenné ktoré vidia iba oni sami.
 */
class Agent
{
  protected:
    sAgentInterface m_interface;

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

    /* Pretypovanie na sAgentInterface vráti hodnotu agentovho interface. */
    operator sAgentInterface() const { return m_interface; }
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
    const std::vector<sAgentInterface> &m_global_state;

    /** \brief Zoznam žiadostí agentov o pridanie nových agentov do grupy. */
    std::vector<Agent*> m_add_agents;

    /** \brief Zoznam žiadostí agentov o odstránenie agentov tejto grupy. */
    std::vector<uint64_t> m_delete_agents;

  public:
    Environment(uint32_t group_id, std::vector<sAgentInterface> &global_state);
    ~Environment();

    /** Vráti agentovi číslo grupy, ktorej je súčasťou. */
    uint32_t this_group_id() const { return m_this_group_id; }

    /** \brief Poskytne agentovi globálny stav prostredia.
     *
     * Ak si agent chce uchovať tento stav musí si urobiť jeho kópiu!
     * Po skončení metódy process bude toto pole dealokované.
     */
    const std::vector<sAgentInterface>& global_state() const { return m_global_state; }

    /** Poskytne agentovi informácie o tele ľubovolného agenta v prostredí */
    const AgentBody* body_of_agent(const sAgentInterface &agent);

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
