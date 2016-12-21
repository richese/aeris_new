#ifndef _COMUNICATION_HEADER_H_
#define _COMUNICATION_HEADER_H_

#include <cstdint>


/* Comunication header definitions */

/** \brief
 *
 * Túto štruktúru pošle klient pri začiatku každej požiadavky serveru.
 * Ako odpoveď server pošle naspäť tú istú štruktúru s opcode nastaveným
 * na OPCODE_SERVER_ACK. Ak je vrátený opcode oný ako OPCODE_SERVER_ACK
 * musí klient ukončiť spojenie.
 * Po úspešnej výmene hlavičiek pokračuje komunikácia podľa typu požiadavky.
 *
 * \var sCommunicationHeader::session_id
 *  Toto číslo je náhodne vygenerované pri štarte servera a zostáva rovnaké
 *  počas jeho celého behu.
 *  Používa sa na kontrolu toho, že sa klient po výpadku spojenia pripojil na
 *  ten istý server.
 *  Každá požiadavka na server musí mať správne číslo session_id inak ju bude
 *  server ignorovať s výnimkou požiadavky OPCODE_REQUEST_GROUP_ID.
 *
 * \var sCommunicationHeader::opcode
 *  Číslo požiadavky, ktorú agent chce aby server spracoval.
 *
 * \var sCommunicationHeader::agent_group_id
 *  Týmto prideleným číslom sa klient identifikuje serveru.
 *
 * \var sCommunicationHeader::data
 *
 */
struct sCommunicationHeader
{
  uint32_t session_id;
  uint16_t opcode;
  uint32_t agent_group_id;

  // TODO
  uint32_t agent_count;
};


/** \brief Klient alebo server deklaruje, že chce ukončiť spojenie.
 *
 * Komunikácia bezpodmienečne končí prijatím hlavičky s týmto kódom.
 */
#define OPCODE_DISCONNECT         ((uint16_t)0x0001)

/** \brief Touto požiadavkou si novo pripojený klient vypýta jedinečný
 * identifikátor od serveru.
 *
 * Pri použití tejto požiadavky klient nastaví sesstion_id a agent_group_id
 * na 0h.
 */
#define OPCODE_REQUEST_GROUP_ID   ((uint16_t)0x0002)

/** \brief Klient žiada o poslanie celého globálneho stavu prostredia. */
#define OPCODE_AGENT_SYNC_ALL     ((uint16_t)0x0003)

/** \brief Klient žiada o poslanie stavu všetkých agentov danej agent grupy. */
#define OPCODE_AGENT_SYNC_GROUP   ((uint16_t)0x0004)

/** \brief Klient žiada o poslanie stavu všetkých agentov daného typu. */
#define OPCODE_AGENT_SYNC_TYPE    ((uint16_t)0x0005)

/** \brief Klient žiada o poslanie stavu agent s daným id. */
#define OPCODE_AGENT_SYNC_ID      ((uint16_t)0x0006)

/** \brief Klient žiada o začlenenie zmien svojich lokálnych agentov do
 * globálneho stavu prostredia.
 */
#define OPCODE_AGENT_COMMIT       ((uint16_t)0x0010)

/** \brief Odpoveď servera pre klienta o tom, že akceptuje jeho požiadavku a
 * môže pokračovať v komunikácií.
 */
#define OPCODE_SERVER_ACK         ((uint16_t)0xA5A5)



#define HEADER_SIZE              (sizeof(sCommunicationHeader))


#endif /* _COMUNICATION_HEADER_H_ */
