#!/usr/bin/env bash

# // -- variables -- //
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# //  -- Create the directory if doesnt exist  --  //
mkdir -p "$SCREENSHOT_DIR"

# // -- Menu options -- //
OPTIONS=" Capture Full Screen\n Capture Area Selection\n Capture Active Window"

# // --  Show menu -- //
# Note: the space in the prompt "capture screen" is necessary for it to look centered, change at ur own risk
SELECTION=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "        Capture Screen" \
    -theme-str '
        window {
            width: 380px;
            x-offset: 0;
            y-offset: 0;
        }
        inputbar {
            enabled: true;
            children: [prompt];
        }
        textbox-prompt-colon {
            enabled: false;
        }
        entry {
            enabled: false;
        }
    '
)

# // Exit if user pressed escape or made no selection
[ -z "$SELECTION" ] && exit 0

# // -- Name the screenshot -- //
FILENAME="$SCREENSHOT_DIR/screenshot_$(date +%Y%m%d_%H%M%S).png"

# // -- Do operations based on what user selected -- //
case "$SELECTION" in
    " Capture Full Screen")
        grim - | satty --filename - --output-filename "$FILENAME" --copy-command wl-copy --early-exit
        ;;
    " Capture Area Selection")
        grim -g "$(slurp)" - | satty --filename - --output-filename "$FILENAME" --copy-command wl-copy --early-exit
        ;;
    " Capture Active Window")
        GEOM=$(niri msg --json focused-window | jq -r '"\(.layout.pos_in_scrolling_layout[0]),\(.layout.pos_in_scrolling_layout[1]) \(.layout.window_size[0])x\(.layout.window_size[1])"')
        if [ -z "$GEOM" ] || [ "$GEOM" = "null,null nullxnull" ]; then
            notify-send "Error" "No active window found"
            exit 1
        fi
        grim -g "$GEOM" - | satty --filename - --output-filename "$FILENAME" --copy-command wl-copy --early-exit
        ;;
esac
