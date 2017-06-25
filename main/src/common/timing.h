#ifndef _OUR_TIME_H_
#define _OUR_TIME_H_

#include <cstdint>
#include <chrono>
#include <thread>


namespace ae
{

/** \brief Namespace contains functions related to time and timestamps. */
namespace time
{


/** \brief Hodiny používané na získavanie aktuálneho času.
 *
 * using namespace ae::time;
 * using std::chrono::duration_cast;
 * auto t = clock::now();
 * sleep_for(milliseconds(520));
 * auto diff = clock::now() - t;
 * std::cout << "Uplinulo " << duration_cast<microseconds>(diff) << " us.\n";
 * LOG(INFO) << "Uplinulo " << duration_cast<milliseconds>(diff) << " ms.  ";
 * std::printf("Uplinulo %lu ms.\n", duration_cast<milliseconds>(diff).count());
 *
 * K dispozícii sú:
 *  std::chrono::system_clock
 *  std::chrono::high_resolution_clock
 */
using clock = std::chrono::system_clock;

/* aliasy pre časové jednotky */
using seconds = std::chrono::seconds;
using milliseconds = std::chrono::milliseconds;
using microseconds = std::chrono::microseconds;

/** \brief Typ používaný na uchovávanie timestampov v AgentInterface */
using agent_time_t = uint64_t;

/** \brief Časová jednotka timestampov AgentInterface
 *
 * Hodnota agent_time_t je počet týchto periód od epochy.
 *
 * Možnosti: http://www.cplusplus.com/reference/ratio/ratio/
 */
using agent_time_period_t = std::micro;

/** \brief Časový interval reprezentovaný typom agent_time_t v jednotkách času
 * agent_time_period_t.
 *
 * Použitý na konverziu času z formátu hodín do formátu agenta.
 */
using agent_duration_t = std::chrono::duration<agent_time_t, agent_time_period_t>;


/** \brief Vráti počet tickov od epochy prekonvertovaný na agent_time_t. */
agent_time_t timestamp();

/** \brief Vráti timestamp oneskorený o dealyed_by od aktuálneho času. */
template<typename D>
agent_time_t future_timestamp(const D &delayed_by)
{
  using std::chrono::duration_cast;
  auto now = clock::now() + delayed_by;
  auto since_epoch = duration_cast<agent_duration_t>(now.time_since_epoch());
  return since_epoch.count();
}

/** \brief Uspí vlákno */
void sleep_until(clock::time_point point);

/* D je {seconds,milliseconds,microseconds,...} */
template<typename D>
void sleep_for(const D &duration)
{
  sleep_until(clock::now() + duration);
}


} /* namespace time */
} /* namespace ae */


#endif /* _OUR_TIME_H_ */
