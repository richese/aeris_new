#!/usr/bin/env bash

# ziskaj absolutnu cestu ku skriptu, nech sa moze volat od hocikadial v systeme
# akurat to zatial nezvladnu binarky lebo maju relativnu cestu ku configure.txt
if [ -z "$MAIN_ROOT_DIR" ]; then
  pushd "$(dirname $0)" > /dev/null
  export MAIN_ROOT_DIR="$(pwd)"
  popd > /dev/null
fi

export MAIN_BUILD_DIR="${MAIN_ROOT_DIR}/.build"

# nazov skriptu
SCRIPT="$(basename $0)"
LAST_PID=""
RUNNING_PIDS=""
RUNNING_LOG_FILES=""

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
    RUNNING_LOG_FILES="${RUNNING_LOG_FILES} ${MAIN_BUILD_DIR}/logs/${NAME}-performance-${LAST_PID}.log"
  else
    echo "$SCRIPT: Target '$NAME' does not exist"
    kill $RUNNING_PIDS
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
      kill $RUNNING_PIDS
      exit 1
    fi
  fi
}


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

function clean_logs
{
  rm -f ${MAIN_BUILD_DIR}/logs/*
}

function print_performance
{
  echo ""
  echo ""
  pushd "$MAIN_ROOT_DIR" > /dev/null
  for log in ${RUNNING_LOG_FILES}; do
    echo "$log"
    python3 parselog.py -s 2 -i "$log"
    echo ""
    echo ""
  done
  popd > /dev/null
}