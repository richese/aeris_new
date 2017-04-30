#!/usr/bin/env bash
# Usage: ./webcam-autofocus DEVICE_ID
# Webcam DEVICE_ID can be obtained by running "v4l2-ctl --list-devices"
# Toggles autofocus for selected device.

export LANG="C"
DEVICE=0

if [ -n "$1" ]; then
  DEVICE="$1"
fi

STATUS="$(v4l2-ctl -d ${DEVICE} -C focus_auto)"
if [ "$STATUS" == "focus_auto: 1" ]; then
  v4l2-ctl -d ${DEVICE} -c focus_auto=0
  echo "Disabled autofocus for webcam ${DEVICE}."
elif [ "$STATUS" == "focus_auto: 0" ]; then
  v4l2-ctl -d ${DEVICE} -c focus_auto=1
  echo "Enabled autofocus for webcam ${DEVICE}."
else
  echo "Webcam ${DEVICE} does not support auto focus."
fi
