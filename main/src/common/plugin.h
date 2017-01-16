#ifndef _PLUGIN_H_
#define _PLUGIN_H_

#include <map>
#include <memory>
#include <mutex>
#include <string>

#include "agent.h"
#include "agent_body.h"
#include "config.h"
#include "logging.h"


using json = nlohmann::json;


namespace ae
{
namespace plugin
{


struct plugin_init_t
{
  const json &conf_storage;
  el::base::type::StoragePointer log_storage;
  ae::helpers::body_storage_t *body_storage;

  plugin_init_t() : conf_storage(config::get) {}
};


/** \brief Štruktúra uchovávajúca funkcie poskytované pluginom.
 *
 * Každý plugin musí obsahovať funkciu s nasledovným prototypom a názvom:
 * extern "C" ae::plugin::plugin_t* (*${AGENT_NAME}_load) ()
 *
 * * extern "C" - lebo zo zdielanej knižnice vieme priamo pripojiť len
 *   C funkcie.
 * * plugin_t* - vracia pointer na pluginom vyplnenú štruktúru plugin_t
 * * názov funkcie je odvodený od názvu pluginu
 *     názov pluginu:        example_agent        ${NAME}
 *     názov load funkcie:   example_agent_load   ${NAME}_load
 *     názov súboru pluginu: libexample_agent.so  lib${NAME}.so
 *
 * Všetky pluginy sú umiestnené v adresári ${MAIN_ROOT_DIR}/lib
 *
 * \var ae::plugin::plugin_t::init
 *   Pointer na inizaliciačnú funkciu pluginu, ktorá sa nachádza v adresnom
 *   priestore zdielanej knižnice (pluginu).
 *   Potrebná preto, lebo zdielaná knižnica má svoje vlastné globálne premenné,
 *   ktoré nie su zdieľné s hlavným programom. Táto funkcia zoberie potrebné
 *   pointre od hlavného programu a nastaví ich v plugine na tie isté hodnoty
 *   aby boli zdieľané.
 *
 *   Pri úspešnej inicializácii pluginu vráti 0.
 *   see also: ae::plugin::plugin_init
 *
 * \var ae::plugin::plugin_t::create
 *   Výžadovaná ak má byť plugin schopný vytvárať inštancie agentov.
 *
 * V prípade potreby nových druhov pluginov sa rozšíri táto štruktúra.
 *
 * \seealso example_agent.cpp
 * \seealso example_agent.h
 */
struct plugin_t
{
  int (*init) (plugin_init_t &init_data);
  std::vector<ae::Agent*>* (*create) (const json &parameters);
};


/** \brief Základná funkcia na inicializovanie pluginu. */
int plugin_init(plugin_init_t &init_data);


/** \brief Plugin na vytváranie agentov.
 *
 */
class Agent
{
  private:
    /** Názov agenta */
    std::string m_plugin_name;
    plugin_t *m_plugin;

  public:
    Agent(const char *agent_name);
    ~Agent();

    /** \brief Načíta agent plugin zo zdieľanej knižnice.
     *
     * Nutné zavolať pred volaním metódy create.
     *
     * \returns
     *   0 - Pri úspešnom načíteni pluginu.
     *  -1 - Ak sa vyskytla chyba. Chyba je vypísaná do logu.
     */
    int load();

    /** \brief Vráti pointer na novú inštanciu agenta poskytovaného pluginom
     *
     * Volateľ tejto funkcie preberá zodpovednosť za dealokáciu pamäte tohto
     * agenta.
     *
     * \returns
     *  Pointer na inštanciu agenta alebo nullptr ak nebol plugin ešte načítaný.
     */
    std::vector<ae::Agent*>* create(const json &parameters);
};


void agent_spawner(const nlohmann::json &list, std::vector<ae::Agent*> &agents);


/** \brief Stará sa o dynamické otváranie a zatváranie zdieľaných knižníc
 * s pluginmi.
 *
 * Na otváranie pluginov sú určené statické metódy triedy.
 *
 * Neotvárať pluginy vo vnútri iných pluginov!
 */
class PluginStorage
{
  private:
    using handle_map_t = std::map<std::string, std::unique_ptr<PluginStorage>>;

    /** \brief Mapa uchovávajúca pointre na otvorené pluginy.
     *
     * Pri ukončení programu automaticky zavrie všetky otvorené zdieľané
     * knižnice.
     */
    static handle_map_t loaded_plugins;

    /** Nedovolí otvárať dva pluginy naraz aby sa predišlo viacnásobnému
     * načítaniu jedného pluginu.
     */
    static std::mutex lock_loaded_plugins;

  public:
    /** \brief Otvorí plugin s daným menom a vráti jeho štruktúru.
     *
     * \param name
     *  Meno pluginu podľa dokumentácie v ae::plugin::plugin_t.
     *
     * \returns
     *   Pri úspechu vráti pointer na štruktúru pluginu.
     *   Ak nastane chyba vráti nullptr.
     **/
    static plugin_t* open_plugin(const std::string &name);

  private:
    static plugin_t* find_plugin(const std::string &name);
    static void register_plugin(const std::string &name, void *handle, plugin_t *plugin);

  public:
    /** \brief 'Pointer na zdieľanú knižnicu' pre potreby dlsym a dlclose. */
    void *handle;

    /** \brief Pointer na štruktúru pluginu. */
    plugin_t *plugin;

  private:
    PluginStorage(void *handle, plugin_t *plugin);
  public:
    /** \brief Zatvorí plugin asociovaný s touto inštanciou.
     *
     * Pluginy sa zatvárajú automaticky pri ukončení programu.
     */
    ~PluginStorage();
};


} /* namespace plugin */
} /* namespace ae */


#endif /* _PLUGIN_H_ */
