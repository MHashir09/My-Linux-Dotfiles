#!/bin/bash

# // -- Get current volume using wpctl -- //
current=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')

# // -- Cap current at 100 for menu selection
if [ "$current" -gt 100 ]; then
    current=100
fi

new=$(echo -e "➯   0\n➯  10\n➯  20\n➯  30\n➯  40\n➯  50\n➯  60\n➯  70\n➯  80\n➯  90\n➯  100" \
      | rofi -dmenu \
      -selected-row $((current/10)) \
      -theme-str '
          textbox-prompt-colon { str: " Volume-level:"; }
          entry { placeholder: ""; }
      ')

if [ -n "$new" ]; then
    volume=$(echo "$new" | grep -o '[0-9]\+')

    # // -- Set volume using wpctl
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "${volume}%"

    # // -- Give it a moment to update
    sleep 0.2

    # // -- Get updated volume
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
    notify-send -h string:x-canonical-private-synchronous:audio -h int:value:$VOL " Volume: ${VOL}%"
fi
