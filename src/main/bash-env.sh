#!/usr/bin/env bash

# nazov skriptu
SCRIPT="$(basename $0)"
LAST_PID=""

# ziskaj absolutnu cestu ku skriptu, nech sa moze volat od hocikadial v systeme
# akurat to zatial nezvladnu binarky lebo maju relativnu cestu ku configure.txt
if [ -z "$MAIN_ROOT_DIR" ]; then
  pushd "$(dirname $0)" > /dev/null
  export MAIN_ROOT_DIR="$(pwd)"
  popd > /dev/null
fi


function spawn
{
  NAME="$1"
  BINARY="$MAIN_ROOT_DIR/$NAME/bin/main.elf"
  shift
  if [ -f $BINARY ]; then
    pushd "$(dirname $BINARY)" > /dev/null
    $BINARY $@ &
    PID="$!"
    popd > /dev/null
    echo "$SCRIPT: Spawned $NAME with PID $PID"
    LAST_PID="$PID"
  else
    echo "$SCRIPT: Target '$NAME' does not exist"
    killall main.elf 2> /dev/null
    exit 1
  fi
}


function check_alive
{
  sleep 1s
  if [ -n "$LAST_PID" ]; then
    kill -s 0 "$LAST_PID"
    if [ "$?" != "0" ]; then
      echo "$SCRIPT: Process $LAST_PID is not alive."
      killall main.elf 2> /dev/null
      exit 1
    fi
  fi
}


function stop
{
  echo "$SCRIPT: Press SPACE to stop execution"
  key="  "
  while [ "$key" != '' ]; do # funguje pre medzeru aj enter
    read -n1 -r key
  done

  killall main.elf
  killall main.elf 2> /dev/null
}
