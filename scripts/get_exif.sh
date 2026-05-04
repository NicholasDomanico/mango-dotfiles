#!/bin/sh

dir=$(echo $1 | sed 's/ /\\ /g')

file=$(echo $dir | sed 's/.*/"&"/')
echo $file
notify-send "$1
$(exiftool -DateTimeOriginal -ExposureTime -FNumber -ISO -S -d "%m-%d-%y %H:%M %p" "$1")"
