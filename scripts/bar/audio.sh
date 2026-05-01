#! /bin/sh
. ~/.cache/wal/colors.sh

case $BLOCK_BUTTON in 
    1) pavucontrol 
esac

volume_raw=$(wpctl get-volume @DEFAULT_SINK@ | grep -Po "(?<=\: ).*") 
status=$(echo $volume_raw | grep -o "\[MUTED\]")

volume=$(echo "($volume_raw * 100)/1" | bc)

color=$color8

if [ $volume -eq 0 -a -z "$status" ]; then
    echo "^c$color^ $volume"
elif [ $volume -gt 0 -a $volume -le 50 -a -z "$status" ]; then
    echo "^c$color^ $volume"
elif [ $volume -gt 50 -a -z $status ]; then
    echo "^c$color^  $volume"
elif [ $status ]; then
    echo "^c$color^$status"
fi

