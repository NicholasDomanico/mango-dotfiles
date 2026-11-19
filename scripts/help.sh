#!/bin/sh

keybindings=$(grep -i ^bind ~/mango-dots/config/mango/config.conf)
filtered=$(echo "$keybindings" | sed -e 's/bind=/\ /g' -e 's/bindl=/\ /g' -e 's/,/, /g' -e 's/\, /+/1' -e 's/\NONE+//' -e 's/^+//' -e 's/,/ = /1' -e 's/spawn, //1')

bind=$(echo "$filtered" | rofi -config ~/mango-dots/config/rofi/help.rasi -dmenu -p 'Search')

if [ -n "$bind" ]; then
    notify-send "$bind"
fi
