#ifndef _AGENT_SERVER_H_
#define _AGENT_SERVER_H_

#include <list>
#include <memory>
#include <mutex>
#include <vector>
#include <thread>

#include "agent.h"
#include "socket.h"


namespace ae
{


class Server
{
  private:
    using interface_buffer_t = std::shared_ptr<std::vector<sAgentInterface>>;

    /** \brief Identifikátor tohto servera náhodne vygenerovaný pri jeho
     * štarte.
     */
    uint32_t m_session_id;

    /** \brief Čítač, podľa ktorého sa priraďujú identifikačné čísla novo
     * pripojeným agent grupám.
     */
    uint32_t m_agent_group_counter;

    /** \brief List všetkých agentov nachádzajúcich sa v prostredí.
     *
     * List pre konštantný čas pri pridávaní a odoberaní agentov.
     * Random access nie je až taký dôležitý, lebo pri kopírovaní do read bufera
     * sa musí preiterovať cez všetkých agentov.
     */
    std::list<sAgentInterface> m_global_state;

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

    /** \brief chráni prístup ku m_global_state (je potrebný?) */
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


    int main();

  private:
    int listen();

    const interface_buffer_t get_read_buffer() const;

    void global_change_watcher();

    void request_handler(std::shared_ptr<Socket> client);

    void request_group_id();
    void request_agent_sync_all();
    void request_agent_sync_type();
    void request_agent_sync_id();
    void request_agent_commit();

};


} /* namespace ae */


#endif /* _AGENT_SERVER_H_ */
