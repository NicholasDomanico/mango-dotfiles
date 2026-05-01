#!/bin/sh
. ~/.cache/wal/colors.sh

options=$(echo "󰐥 Shutdown\n󰜉 Reboot" | rofi -dmenu -config ~/.config/rofi/popup.rasi -theme-str 'listview {scrollbar: false;} window {width: 20%; height: 20%;}')

case "$options" in 
    "󰐥 Shutdown") shutdown now;;
    "󰜉 Reboot") reboot;;
esac

