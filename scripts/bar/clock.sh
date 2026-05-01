#!/bin/sh
. ~/.cache/wal/colors.sh

time=$(date +"%I:%M %p")
output="^c$color9^$time"

notify-send -h string:bgcolor:$background -h string:fgcolor:$color3 -a "" -i NONE "$(date +"%I:%M %p")"
