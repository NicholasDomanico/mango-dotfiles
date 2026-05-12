#!/bin/sh

cliphist list | rofi -config ~/mango-dots/config/rofi/clipboard.rasi -dmenu | cliphist decode | wl-copy

