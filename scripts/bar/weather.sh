#!/bin/sh
. ~/.cache/wal/colors.sh

if [ -z $XDG_CACHE_HOME ]; then
    cachedir="$HOME/.cache"
else
    cachedir="$XDG_CACHE_HOME"
fi

if [ ! -d "$cachedir/dwmBlocksWeather" ]; then
    mkdir "$cachedir/dwmBlocksWeather"
fi


currentWeatherFile="$cachedir/dwmBlocksWeather/currentWeather.txt"
weatherFile="$cachedir/dwmBlocksWeather/weather.json"

if [ ! -f "$weatherFile" ]; then
    touch $weatherFile
fi

getCurrentWeather() {
    curl -s "https://wttr.in/port-richey?format=1" | sed -e "s/\ \ +/\ /" -e "s/F//" -e "s/\xEF\xB8\x8F//g" > $currentWeatherFile
}

getWeather() {
    curl -s "https://wttr.in/port-richey?format=j1" > $weatherFile
}

timeLastChecked=$(date -r $currentWeatherFile +%s)
currentTime=$(date "+%s")
if [ $((currentTime - $timeLastChecked)) -gt 1800 ]; then
    ping -c 1 wttr.in
    if [ $? -ne 0 ]; then
        exit
    fi
    getCurrentWeather
    sleep 5
    getWeather
fi

temp=$(cat $weatherFile | jq -r ".current_condition.[0].temp_F")
feelsLike=$(cat $weatherFile | jq -r ".current_condition.[0].FeelsLikeF")
humidity=$(cat $weatherFile | jq -r ".current_condition.[0].humidity")
description=$(cat $weatherFile | jq -r ".current_condition.[0].weatherDesc.[0].value")

icon=$(cat "$currentWeatherFile")

currenwConditions=$(echo "$description\n${temp}F\nFeels Like ${feelsLike}°F\nHumidity ${humidity}%")

case $BLOCK_BUTTON in 
    1) notify-send -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE "$currenwConditions"
esac

echo "$icon"
