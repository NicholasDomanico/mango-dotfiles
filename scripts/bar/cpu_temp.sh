#! /bin/sh
. ~/.cache/wal/colors.sh

color="$color5"

temp="$(sensors -J | jq '."dell_smm-isa-00de"."temp1"."input"."value"')C"

case $BLOCK_BUTTON in 
    1) notify-send -t 2000 -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE "CPU Temp: $temp"
esac

echo "^c$color^"
