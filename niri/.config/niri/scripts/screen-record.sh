#!/bin/bash

# Set the output directory
OUTPUT_DIR="$HOME/Videos/Screen-recordings"

# Check if wf-recorder is running
if pgrep -x "wf-recorder" > /dev/null; then
    # Stop recording
    pkill -SIGINT wf-recorder
    notify-send "Recording stopped" "Video saved to $OUTPUT_DIR/"
else
    # Create directory if it doesn't exist
    mkdir -p "$OUTPUT_DIR"

    # Check if directory creation was successful
    if [ ! -d "$OUTPUT_DIR" ]; then
        notify-send "Recording failed" "Could not create directory: $OUTPUT_DIR"
        exit 1
    fi

    # Start recording with timestamp
    FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
    wf-recorder -a -f "$FILENAME" &

    # Check if wf-recorder started successfully
    sleep 0.5
    if pgrep -x "wf-recorder" > /dev/null; then
        notify-send "Recording started" "Press keybind again to stop"
    else
        notify-send "Recording failed" "wf-recorder could not start"
    fi
fi
