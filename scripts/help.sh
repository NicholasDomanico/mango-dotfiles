#!/bin/sh

bind=$(grep -i ^bind ~/mango-dots/config/mango/config.conf | rofi -config ~/mango-dots/config/rofi/help.rasi -show run -dmenu)
notify-send "$bind"
