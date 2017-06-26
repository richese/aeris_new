#ifndef _TYPES_H_
#define _TYPES_H_

#include <mutex>

#include "logging.h"
#include "timing.h"


namespace ae {


struct Point2D
{
  Point2D() : x(0.0f), y(0.0f) {}
  Point2D(float x, float y) : x(x), y(y) {}

  float x, y;
};


struct Point3D
{
  Point3D() : x(0.0f), y(0.0f), z(0.0f) {}
  Point3D(float x, float y, float z) : x(x), y(y), z(z) {}

  float x, y, z;
};


struct AgentPosition
{
  float x, y, z;
  float roll, pitch, yaw;
};


struct Color
{
  float r, g, b;
};


/** \brief Štruktúra popisujúca stav agenta v prostredí.
 *
 * Takto agenti vidia všetkých ostatných agentov v prostredí.
 *
 * \var AgentInterface::id
 *   Unikátny identifikátor agenta v prostredí.
 *   Hodnotu priraďuje AgentGroup pri registrácii agenta do prostredia
 *   agent ju nesmie meniť.
 *
 * \var AgentInterface::type
 *   Identifikátor typu agenta podľa jeho úlohy.
 *
 * \var AgentInterface::body
 *   Identifikátor typu tela agenta pre vizualizáciu a výpočet kolízii.
 *
 * \var AgentInterface::timestamp
 *   Čas poslednej aktualizácie tohto agenta.
 *   Hodnota je absolútny čas v mikrosekundách od počiatku unixovej epochy.
 *   Preto je potrebné aby čas na všetkých strojoch bol synchronizovaný
 *   pomocou NTP protokolu.
 *
 * \var AgentInterface::expires
 *   Absolútny čas, po ktorom možno agenta považovať za zombie.
 *   Hodnota <= 0 značí, že agent neexpiruje.
 *
 * \var AgentInterface::position
 *   X, Y, Z koordináty agenta v prostredí. Koordináty sú v cm.
 *   Roll, Pitch, Yaw rotácia agneta v prostredí v ???.
 *   Veľkosť hracej plochy v cm určí konfiguračný súbor podľa rozlíšenia
 *   a uhlopriečky reálnej hracej plochy na LED paneli.
 *
 * \var AgentInterface::color
 *   R, G, B komponenty farby robota vo vizualizácii avšak môže značiť aj stav
 *   agenta pre iných agentov.
 *   Hodnoty sú v rozsahu 0.0f až 1.0f.
 *
 * \var AgentInterface::value
 *   Toto pole obsahuje ďalšie stavové informácie o agentovi.
 *   To ako sú tieto hodnoty interpretované (typ, hodnota) ja na agentoch.
 */
struct AgentInterface
{
  uint64_t id;
  uint16_t type;
  uint16_t body;

  ae::time::agent_time_t timestamp;
  ae::time::agent_time_t expires;

  AgentPosition position;
  Color color;

  uint16_t value[4];


  operator bool() const { return id != 0; }

  /* Porovnávanie agentov na základe id. */
  bool operator ==(const AgentInterface &b) const { return id == b.id; }
  bool operator !=(const AgentInterface &b) const { return id != b.id; }
  bool operator  <(const AgentInterface &b) const { return id  < b.id; }
  bool operator  >(const AgentInterface &b) const { return id  > b.id; }
};


/** \brief Contains internal objects for memory managment between application
 * and plugins.
 */
namespace helpers {


/** \brief Template providing unified interface for sharing data between main
 * application and plugins.
 */
template <typename T>
struct SharedStorage
{
private: /* static member variables */
  static SharedStorage<T> local_storage;

  /** \brief The storage that is currently being used.
   *
   * For main application it is always equal to local_storage.
   *
   * Plugins set this variable to storage provided on plugin initialization.
   * This results in all plugins having the same storage as the main application.
   *
   * \see ae::plugin::SharedData
   * \see ae::plugin::plugin_init
   */
  static SharedStorage<T>* active_storage;

public: /* static functions */
  static SharedStorage<T>* get()
  {
    return active_storage;
  }

  static void set(SharedStorage<T>* new_storage)
  {
    // LOG(DEBUG) << "Local: " << &local_storage << " Active: " << active_storage << " New: " << new_storage;

    if (new_storage != nullptr)
    {
      if (new_storage != active_storage)
      {
        active_storage = new_storage;
      }
      // else
      // {
      //   LOG(WARNING) << "SharedStorage: Active storage already set.";
      // }
    }
    else
    {
      active_storage = &local_storage;
    }
  }

  SharedStorage<T>() : data(), lock() {}

public: /* member variables */
  T data;
  std::mutex lock;
};

template <typename T>
SharedStorage<T> SharedStorage<T>::local_storage;

template <typename T>
SharedStorage<T>* SharedStorage<T>::active_storage = &SharedStorage<T>::local_storage;


} /* namespace helpers */


} /* namespace ae */


#endif /* _TYPES_H_ */
