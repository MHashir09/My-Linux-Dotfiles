#!/bin/bash

OUTPUT_DIR="$HOME/Videos/Screen-recordings"
PID_FILE="/tmp/ffmpeg-recorder.pid"
mkdir -p "$OUTPUT_DIR"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if kill -0 $PID 2>/dev/null; then
        kill -TERM $PID 2>/dev/null
        sleep 1
        kill -9 $PID 2>/dev/null
        rm -f "$PID_FILE"
        notify-send "Recording stopped" "Video saved to $OUTPUT_DIR/"
        exit 0
    else
        rm -f "$PID_FILE"
    fi
fi

# Start recording
FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
RESOLUTION=$(xdpyinfo | grep dimensions | awk '{print $2}')

ffmpeg -f x11grab -video_size $RESOLUTION -i :0.0 \
       -c:v libx264 -preset ultrafast -crf 18 \
       "$FILENAME" > /dev/null 2>&1 &

echo $! > "$PID_FILE"
sleep 1

if kill -0 $(cat "$PID_FILE") 2>/dev/null; then
    notify-send "Recording started" "Press keybind again to stop"
else
    rm -f "$PID_FILE"
    notify-send "Recording failed" "Check terminal for errors"
fi
