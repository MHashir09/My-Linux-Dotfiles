#!/bin/bash
BRIGHT=$(brightnessctl get -P)
notify-send -h string:x-canonical-private-synchronous:brightness -h int:value:$BRIGHT " Brightness: ${BRIGHT}%"
