#!/usr/bin/env bash

## Získaj absolútnu cestu ku skriptu a exportuj ju nech je dostupná pre všetky
## programy spustené týmto skriptom.
if [ -z "$MAIN_ROOT_DIR" ]; then
  pushd "$(dirname $0)" > /dev/null
  export MAIN_ROOT_DIR="$(pwd)"
  popd > /dev/null
fi

## Adresár v ktorom prebieha kompilácia.
MAIN_BUILD_DIR="${MAIN_ROOT_DIR}/.build"

## Názov skriptu
SCRIPT="$(basename $0)"

## PID posledného programu spusteného funkciou `spawn`.
LAST_PID=""

## Medzerou oddelený zoznam PID všetkých programov spustených funkciou `spawn`.
RUNNING_PIDS=""

## Medzerou oddelený zoznam logovacích súborov programov spustených funkciou `spawn`.
PERFORMANCE_LOGS=""

## Spustí program agenta / servera zo správneho podadresára a nastaví s ním súvisiace premenné prostredia.
## Usage: spawn program [program_arguments]
function spawn
{
  NAME="$1"
  BINARY="${MAIN_BUILD_DIR}/${NAME}/${NAME}.elf"
  shift
  if [ -f $BINARY ]; then
    pushd "$(dirname $BINARY)" > /dev/null
    $BINARY $@ &
    PID="$!"
    popd > /dev/null
    # echo "$SCRIPT: Spawned $NAME with PID $PID"
    LAST_PID="$PID"
    RUNNING_PIDS="$RUNNING_PIDS $PID"
    PERFORMANCE_LOGS="${PERFORMANCE_LOGS} ${MAIN_BUILD_DIR}/logs/${NAME}-performance-${LAST_PID}.log"
  else
    echo "$SCRIPT: Target '$NAME' does not exist"
    kill $RUNNING_PIDS
    exit 1
  fi
}

## Skontroluje či posledný program spustený funkciou `spawn` stále žije.
## Použiť na overenie toho či nespadol server kvôli obsadenému portu.
## Usage: check_alive
function check_alive
{
  if [ -n "$LAST_PID" ]; then
    kill -s 0 "$LAST_PID"
    if [ "$?" != "0" ]; then
      echo "$SCRIPT: Process $LAST_PID is not alive."
      kill $RUNNING_PIDS
      exit 1
    fi
  fi
}

## Spustí čakaciu slučku, ktorá čaká na stlačenie klávesy SPACE alebo RETURN
## v terminále. Po jej stlačení pošle signál SIGTERM všetkým programom spusteným
## pomovou funkcie `spawn`.
## Usage: stop
function stop
{
  # echo "$SCRIPT: Press SPACE to stop execution"
  key="  "
  while [ "$key" != '' ]; do # funguje pre medzeru aj enter
    read -n1 -r key
  done

  # echo ""
  # echo "$SCRIPT: Killing processes: $RUNNING_PIDS"
  kill $RUNNING_PIDS
}

## Vymaže všetky súbory nachádzajúce sa v logovacom adresári.
## Usage: clean_logs
function clean_logs
{
  rm -f ${MAIN_BUILD_DIR}/logs/*
}

## Vypíše štatistiky o časovej náročnosti kritických častí programov spustencýh
## funkciou `spawn`.
## See also: common/logging.h
## See also: parselog.py
## Usage: print_performance
function print_performance
{
  echo ""
  echo ""
  pushd "$MAIN_ROOT_DIR" > /dev/null
  for log in ${PERFORMANCE_LOGS}; do
    echo "$log"
    python3 parselog.py -s 2 -i "$log"
    echo ""
    echo ""
  done
  popd > /dev/null
}
