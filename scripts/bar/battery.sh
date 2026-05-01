#! /bin/sh
. ~/.cache/wal/colors.sh

status=$(cat /sys/class/power_supply/BAT0/status)
charge=$(cat /sys/class/power_supply/BAT0/capacity)
case $BLOCK_BUTTON in 
    1) notify-send -t 2000 -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE "$(acpi -b)"
esac

case $status in
    "Discharging")
        color="$color6" ;;
    "Full")
        color=#00d000 ;;
    "Charging")
        color=#00d000 ;;
    *)
        color="$color6" ;;
esac

red=#ff0f00

if [ $charge -gt 80 ]; then
    echo "^c$color^ $charge%"
elif [ $charge -gt 60 -a $charge -le 80 ]; then
    echo "^c$color^ $charge%"
elif [ $charge -gt 40 -a $charge -le 60 ]; then
    echo "^c$color^ $charge%"
elif [ $charge -gt 15 -a $charge -le 40 ]; then
    echo "^c$color^ $charge%"
elif [ $charge -le 15 ]; then 
    echo "^c$red^ $charge%"
fi


