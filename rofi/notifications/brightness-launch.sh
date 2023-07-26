#!/bin/bash

brightness_level="$(($(brightnessctl g) * 100 / $(brightnessctl m)))%"

# kill previous processes
killall rofi &> /dev/null
killall brightness-notification.sh &> /dev/null
killall sleep &> /dev/null

rofi \
    -show drun \
    -theme ~/.config/rofi/notifications/brightness.rasi \
    -theme-str 'textbox-percentage { content: "'$brightness_level'"; }' &

echo $! > notification-pid
echo $! 

sleep 1000

# clean up
pid=$(cat notification-pid)
kill $pid
echo "" > notification-pid
