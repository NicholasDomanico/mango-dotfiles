#!/bin/sh
. ~/.cache/wal/colors.sh

date=$(date +"%a, %b %d")
output="^c$color8^$date"

case $BLOCK_BUTTON in 
#    1) notify-send -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE " $(date +"%A, %B %d")" && notify-send -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE "$(cal | tail -n +2)"
    1) notify-send -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE "$(date +"%A, %B %d")

$(cal | tail -n +2)" 
esac

echo $output
