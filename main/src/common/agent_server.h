#ifndef _AGENT_SERVER_H_
#define _AGENT_SERVER_H_

#include <atomic>
#include <memory>
#include <map>
#include <mutex>
#include <vector>

#include "agent.h"
#include "communication_header.h"
#include "socket.h"


namespace ae
{


class Server
{
  private:
    using interface_buffer_t = std::shared_ptr<std::vector<AgentInterface>>;

    /** \brief Identifikátor tohto servera náhodne vygenerovaný pri jeho
     * štarte.
     * TODO
     */
    uint32_t m_session_id;

    /** \brief Čítač, podľa ktorého sa priraďujú identifikačné čísla novo
     * pripojeným agent grupám.
     */
    std::atomic<uint32_t> m_agent_group_counter;

    /** \brief List všetkých agentov nachádzajúcich sa v prostredí.
     *
     *
     *
     */
    std::map<uint64_t, AgentInterface> m_global_state;

    /** \brief Kópia aktuálneho stavu prostredia, ktorá sa posúva agent grupám.
     *
     * Keď sa aplikujú zmeny na globálny stav vytvorí sa jeho read-only kópia,
     * ktorú si zoberie request_handler. Keďže toto je súvislé pole môže ho
     * poslať naraz cez jedno systémové volanie.
     *
     * Táto kópia je automaticky nahradená po aplikovaní zmien na globálny stav.
     * shared_ptr zaručuje to, že pole sa automaticky dealokuje keď ho prestane
     * používať posledný request_handler.
     *
     * Prístup je chránený mutexom, takže treba pristupovať pomocou metódy
     * get_read_buffer.
     */
    interface_buffer_t m_read_buffer;

    /** \brief chráni prístup ku m_global_state */
    std::mutex m_lock_global_state;

    /** \brief Chráni prístup k m_read_buffer */
    std::mutex m_lock_read_buffer;

    /** \brief List všetkých socketov, spravovaných serverom.
     *
     * Zahŕňa serverové sockety aj sockety ku klientom.
     */
    SocketWatch m_sockets;

  public:
    Server();
    ~Server();

    /* \brief Main server loop.
     *
     * Returns when exit signal is received.
     */
    int main();

  private:
    /** \brief Opens server sockets according to configuration. */
    int listen();

    /** \brief Gets pointer to most recent global state buffer. */
    const interface_buffer_t get_read_buffer();

    /** \brief Updates global state based on data received from agent groups.
     *
     * All agents have to be from the same agent group.
     *
     * \param agents List of agents received from agent group.
     *   Possible agent situations:
     *   Is in global state | Is in agents | action
     *   -------------------+--------------+------------------------------------
     *   true               |  true        | Update agent interface in global state
     *   false              |  true        | Adds this agent interface into global state
     *   true               |  false       | Removes this agent interface from global state
     *
     */
    void update_global_state(const std::vector<AgentInterface> &agents);

    /** \brief Checks global state for expired agents and removes them. */
    void expired_agent_check();

    /** \brief Creates new read-only copy of global state for buffered network operations.
     *
     * Does not lock global state!
     */
    void update_read_buffer();

    /** \brief Handles communication requests from clients.
     *
     * Determines type of request from header and calls apropriate request handler.
     */
    void request_handler(std::shared_ptr<Socket> client);

    /** \brief Newly connected agent group is asking for a group id. */
    void request_group_id(std::shared_ptr<Socket> client);

    /** \brief Group requested current agent global state from server. */
    void request_agent_sync_all(std::shared_ptr<Socket> client, sCommunicationHeader &header);

    /** \brief Group wants to send updated state of its agents to server. */
    void request_agent_commit(std::shared_ptr<Socket> client, sCommunicationHeader &header);

};


} /* namespace ae */


#endif /* _AGENT_SERVER_H_ */
