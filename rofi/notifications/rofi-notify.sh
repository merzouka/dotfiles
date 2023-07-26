#!/bin/bash

if [ ! -d "$HOME/.pipes" ]; then
    mkdir "$HOME/.pipes"
fi

icon_pipe="$HOME/.pipes/rofi-notification-icon-pipe"
value_pipe="$HOME/.pipes/rofi-notification-value-pipe"

if [ ! -e $icon_pipe ]; then 
    mkfifo "$icon_pipe"
fi
if [ ! -e $value_pipe ]; then 
    mkfifo "$value_pipe"
fi

if [ "$1" == "brightness" ]; then
    icon=""
    value=$(( $(brightnessctl g) * 100 / $(brightnessctl m) ))
elif [ "$1" == "sound" ]; then
    value=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master) | awk -F "%" '{ print $1}')
    state=$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))
    if [ "state" != "on" ]; then
        value="Muted"
        icon="󰖁"
    else
        if (( value >= 70 )); then
            icon="󰕾"
        elif (( value < 70 && value >= 30 )); then
            icon="󰖀"
        elif (( value < 30 && value > 0 )); then
            icon="󰕿"
        else
            icon="󰖁"
            value="Muted"
        fi
    fi
else
    echo "invalid mode"
    exit -1
fi

if [ "$value" != "Muted" ]; then
    value="$value%"
fi

pid=$( pidof rofi-notify.sh )
if [ "$pid" != "" ]; then
    echo $icon > $icon_pipe
    echo $value > $value_pipe
    exit 0
fi

i=0

while [[ "$value" != "e" && i -lt 10 ]]
do
    if [ "$i" != "0" ]; then
        kill $pid
        killall sleep.sh
    fi
    (( i++ ))
    echo $i
   
    # if [ "$i" == "0" ]; then
    #     (( i++ ))
    # fi

    rofi \
        -show window \
        -theme $HOME/.config/rofi/notifications/notification.rasi \
        -theme-str 'textbox-percentage { content: "'"$value"'"; }' \
        -theme-str 'textbox-icon { content: "'"$icon"'"; }' &
    pid=$!

    echo "before sleep"

    $HOME/.config/rofi/notifications/sleep.sh &
   
    echo "after sleep"
    read -r icon < $icon_pipe
    read -r value < $value_pipe
    echo "echo after read"
    echo $icon
    echo $value
done

kill $pid
