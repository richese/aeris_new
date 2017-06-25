#ifndef _AGENT_GROUP_H_
#define _AGENT_GROUP_H_

#include <cstdint>

#include <memory>
#include <vector>

#include "agent.h"
#include "agent_client.h"
#include "timing.h"


namespace ae
{


/** \brief Poskytuje prostredie agentov pre agentov.
 *
 * Táto trieda je samostatne použiteľná pre simulácie agentov na jednom
 * fyzickom stroji. Nerieši žiadnu sieťarinu a tvári sa ako jediná grupa
 * v prostredí (globálny stav == lokálny stav).
 */
class AgentGroup
{
  protected:
    using agents_iter_t = std::vector<Agent*>::iterator;

  protected:
    /** \brief Unikátne číslo identifikujúce grupu a jej agentov.
     *
     * Určuje prefix pre id všetkých agentov tejto grupy v 32 horných bitoch
     * ich id.
     **/
    uint32_t m_group_id;

    /** \brief Počítadlo agentov vytvorených v tejto grupe.
     *
     * Používa sa na vygenerovanie unikátneho identifikátora pre každého agenta
     * grupy. Grupa teda môže za svoj život vytvoriť maximálne 2**32-2 agentov.
     */
    uint32_t m_agent_counter;

    /** \brief Časový interval, ktorý sa grupa snaží dodržiavať medzi
     * jednotlivými aktualizáciami agentov.
     */
    time::milliseconds m_dt;

    /** \brief Definuje, v koľkých vláknach má grupa paralelne aktualizovať
     * agentov.
     */
    uint32_t m_njobs;

    /** \brief Indikuje, či je spustená halvná slučka grupy. */
    bool m_running;

    /** \brief Globálny stav prostredia zahŕňajúci všetkých agentov zo všetkých
     * grúp.
     *
     * Agenti sú reprezentovaný pomocou zjednodušeného modelu tvoreného
     * štruktúrou AgentInterface.
     * Toto je jediný zdroj informácii o prostredí agenta.
     *
     * Pointer na pole, nech sa dá jednoducho vymeniť za nové čo príde zo serveru.
     */
    std::vector<AgentInterface> *m_global_state;

    /** \brief Pole všetkých agentov obsluhovaných touto grupou. */
    std::vector<Agent*> m_agents;

  public:
    AgentGroup(time::milliseconds dt, uint32_t njobs);
    virtual ~AgentGroup();

    /** \brief Vráti identifikačné číslo tejto grupy. */
    uint32_t group_id() const { return m_group_id; }

    /** \brief Počet agentov nachádzajúcich sa v grupe. */
    uint32_t size() const { return m_agents.size(); }

    /** \brief vygeneruje unikátny identifikátor pre nového agenta. */
    uint64_t generate_agent_id();

    /** \brief Pridaj nového agenta do grupy.
     *
     * \param agent
     *   Inštancia agenta, ktorú vložiť do grupy.
     */
    void push_back(Agent *agent);

    /** \brief spustí hlavnú slučku grupy.
     *
     * Po jej spustení už nie je možné zvonku pridávať nových agentov do grupy.
     *
     * \returns
     *   0 - Pri úspešnov ukončení hlavnej slučky.
     *  -1 - Ak sa vyskytla chyba, po ktorej slučka nedokáže pokračovať.
     */
    virtual int main();

  protected:
    /** \brief Získaj aktuálny globálny stav */
    virtual int sync();

    /** \brief Aktualizuje stav všetkých agentov.
     *
     * Aktualizácia prebieha v m_njobs vláknach.
     */
    int process();

    /** \brief Prejde všetkých lokálnych agentov a aktualizuje globálny stav. */
    virtual int commit();

  private:
    /** \brief Po aktualizácii agentov spracuje ich požiadavky na
     * pridanie / odobranie agentov z grupy.
     *
     * Žiadosť sa musí týkať iba agentov tejto grupy inak bude ignorovaná.
     *
     * Nový agenti sú priradený tejto grupe a je im vygenerované id.
     * Môžu byť odobraný len agenti, ktorý sa nachádzajú v tejto grupe.
     *
     * \param env
     *   Rozhranie, ktoré nazbieralo žiadosti agentov počas ich aktualizácie.
     */
    void apply_agent_requests(Environment &env);

    /** \brief Funkcia na spracovanie daného rozsahu agentov v samostatnom vlákne. */
    Environment process_range(agents_iter_t start, agents_iter_t end);
};


/** \brief Sieťová grupa, ktorá je súčasťou väčšieho prostredia tvoreného
 * viacerými grupami.
 *
 * Globálny stav je sprostredkovaný pomocou jedného servera, ku ktorému
 * sa pripájajú všetky grupy.
 */
class NetAgentGroup : public AgentGroup
{
  public:
    NetAgentGroup(time::milliseconds dt, uint32_t njobs);
    virtual ~NetAgentGroup();

    int main();

  private:
    int receive_agent_group_id();
    int sync();
    int commit();

    int disconnect();

  private:
    Client m_client;
};


/** Grupa, čo beží priamo na serveri a má k dispozícii zdieľanú pamäť so serverom  */
// class ServerAgentGroup : public AgentGroup
// {
//
// };


} /* namespace ae */


#endif /* _AGENT_GROUP_H_ */
