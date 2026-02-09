#!/bin/bash
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"
FILENAME="$SCREENSHOT_DIR/screenshot_$(date +%Y%m%d_%H%M%S).png"

grim -g "$(slurp)" - | satty --filename - --output-filename "$FILENAME" --copy-command wl-copy --early-exit
