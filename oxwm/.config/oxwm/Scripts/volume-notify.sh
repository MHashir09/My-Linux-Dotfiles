#!/bin/bash
VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
notify-send -h string:x-canonical-private-synchronous:audio -h int:value:$VOL " Volume: ${VOL}%"
