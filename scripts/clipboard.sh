#!/bin/sh

cliphist list | rofi -config ~/mango-dots/config/rofi/popup.rasi -dmenu | cliphist decode | wl-copy
