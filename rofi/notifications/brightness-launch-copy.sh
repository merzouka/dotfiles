#!/bin/bash

brightness_level="$(($(brightnessctl g) * 100 / $(brightnessctl m)))%"

# kill the previous running notification process
if [ -e notification-pid ]; then
    previous_pid=$(cat notification-pid)
    if [ "$previous_pid" != "" ]; then
        kill $previous_pid
    fi
fi

rofi \
    -show drun \
    -theme ~/.config/rofi/notifications/brightness.rasi \
    -theme-str 'textbox-percentage { content: "'$brightness_level'"; }' &

echo $! > notification-pid

sleep 1

# clean up
pid=$(cat notification-pid)
kill $pid
echo "" > notification-pid
