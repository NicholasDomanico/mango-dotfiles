#! /bin/sh
. ~/.cache/wal/colors.sh

signal=$(iw dev wlan0 link | grep "signal" | tr -d '\t-' | cut -d ' ' -f 2)
network=$(iw dev wlan0 link | grep "SSID" | tr -d '\t-' | cut -d ' ' -f 2)

case $BLOCK_BUTTON in 
    1) notify-send -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE "$(iw dev wlan0 link)"
        ;;
    3) st -c "pavucontrol" -e nmtui
        ;;
esac

color=$color2

if [ $signal -le 50 ]; then
    echo "^c$color^󰤨"
elif [ $signal -gt 50 -a $signal -le 60 ]; then
    echo "^c$color^󰤥"
elif [ $signal -gt 60 -a $signal -le 70 ]; then
    echo "^c$color^󰤢"
elif [ $signal -gt 70 -a $signal -le 80 ]; then
    echo "^c$color^󰤟"
elif [ $signal -gt 80 -a $signal -le 90 ]; then
    echo "^c$color^󰤯"
elif [ -z $signal]; then
    echo "^c$color^󰤮"
fi
