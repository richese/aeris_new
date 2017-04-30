#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "usage $0 VIDEO_FILENAME"
    exit 1
fi

ffmpeg -f v4l2 -i /dev/video1 -c:v h264 -s 640x360 -framerate 25 $1
