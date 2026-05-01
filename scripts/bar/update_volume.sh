#! /bin/sh

if [ $1 = "up" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.5 && pkill -40 -x dwmblocks
elif [ $1 = "down" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05- -l 1.5 && pkill -40 -x dwmblocks
elif [ $1 = "mute" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && pkill -40 -x dwmblocks
fi
