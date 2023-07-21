#!/bin/bash
brightness=$(($(brightnessctl g) * 100 / 26666))

# notify-send.py "Bildschirmhelligkeit" "$brightness/100" \
#                          # --hint string:image-path:video-display boolean:transient:true \
#                          # boolean:transient:true \
#                                 int:has-percentage:$brightness\
#                          --replaces-process "brightness-popup"
notify-send.py "Bildschirmhelligkeit" "$brightness%" \
    --hint int:has-percentage:19
                            # --replaces-process "brightness-popup"
