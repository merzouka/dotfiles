#!/bin/bash

volume_level=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master) | awk -F "%" '{ print $1}')

# kill the previous running notification process
if [ -e notification-pid ]; then
    previous_pid=$(cat notification-pid)
    if [ "$previous_pid" != "" ]; then
        kill $previous_pid
    fi
fi

# icon selection
if (( volume_level >= 70 )); then
    volume_icon="󰕾"
elif (( volume_level < 70 && volume_level >= 30 )); then
    volume_icon="󰖀"
elif (( volume_level < 30 && volume_level > 0 )); then
    volume_icon="󰕿"
else
    volume_icon="󰖁"
fi

rofi \
    -show drun \
    -theme ~/.config/rofi/notifications/volume.rasi \
    -theme-str 'textbox-percentage { content: "'$volume_level'%"; }' \
    -theme-str 'textbox-icon { content: "'$volume_icon'"; }' &


echo $! > notification-pid

sleep 1

# clean up
pid=$(cat notification-pid)
kill $pid
echo "" > notification-pid
