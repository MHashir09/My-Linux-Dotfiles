#!/bin/bash
BRIGHT=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
notify-send -a "Brightness" -u low -h int:value:$BRIGHT -h string:synchronous:brightness "Brightness: ${BRIGHT}%"
