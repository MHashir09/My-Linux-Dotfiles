#!/usr/bin/env bash

# // --- Uncomment this if you are on x11 --- //

# // -- variables -- //
OUTPUT_DIR="$HOME/Videos/Screen-recordings"
PID_FILE="/tmp/ffmpeg-recorder.pid"
PAUSE_FILE="/tmp/ffmpeg-recorder-paused"

# // -- Create output directory if it doesn't exist -- //
mkdir -p "$OUTPUT_DIR"

# // -- Check recording status -- //
if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
    if [ -f "$PAUSE_FILE" ]; then
        OPTIONS=" Resume Recording\n Stop Recording"
    else
        OPTIONS=" Pause Recording\n Stop Recording"
    fi
else
    OPTIONS=" Start Full Screen\n Start Area Selection\n Start Window"
fi

# // -- Show menu -- //
SELECTION=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "        Record Screen" \
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

# // -- Exit if no selection -- //
[ -z "$SELECTION" ] && exit 0

# // -- Do operations based on what user selected -- //
case "$SELECTION" in
    " Start Full Screen")
        FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
        RESOLUTION=$(xdpyinfo | grep dimensions | awk '{print $2}')
        ffmpeg -f x11grab -video_size $RESOLUTION -i :0.0 \
               -c:v libx264 -preset ultrafast -crf 18 \
               "$FILENAME" > /dev/null 2>&1 &
        echo $! > "$PID_FILE"
        [ -f "$PAUSE_FILE" ] && rm "$PAUSE_FILE"
        notify-send "Recording started" "Full screen"
        ;;
    " Start Area Selection")
        FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
        AREA=$(slop -f "%wx%h+%x,%y")
        if [ -z "$AREA" ]; then
            notify-send "Recording cancelled" "No area selected"
            exit 0
        fi
        SIZE=${AREA%+*}
        OFFSET=${AREA#*+}
        ffmpeg -f x11grab -video_size $SIZE -i :0.0+$OFFSET \
               -c:v libx264 -preset ultrafast -crf 18 \
               "$FILENAME" > /dev/null 2>&1 &
        echo $! > "$PID_FILE"
        [ -f "$PAUSE_FILE" ] && rm "$PAUSE_FILE"
        notify-send "Recording started" "Selected area"
        ;;
    " Start Window")
        FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
        # Get active window geometry with xdotool
        WINDOW_ID=$(xdotool getactivewindow)
        if [ -z "$WINDOW_ID" ]; then
            notify-send "Error" "No active window found"
            exit 1
        fi
        eval $(xdotool getwindowgeometry --shell $WINDOW_ID)
        ffmpeg -f x11grab -video_size ${WIDTH}x${HEIGHT} -i :0.0+${X},${Y} \
               -c:v libx264 -preset ultrafast -crf 18 \
               "$FILENAME" > /dev/null 2>&1 &
        echo $! > "$PID_FILE"
        [ -f "$PAUSE_FILE" ] && rm "$PAUSE_FILE"
        notify-send "Recording started" "Current window"
        ;;
    " Pause Recording")
        if [ -f "$PID_FILE" ]; then
            kill -STOP $(cat "$PID_FILE")
            touch "$PAUSE_FILE"
            notify-send "Recording paused" "Resume from menu"
        fi
        ;;
    " Resume Recording")
        if [ -f "$PID_FILE" ]; then
            kill -CONT $(cat "$PID_FILE")
            rm -f "$PAUSE_FILE"
            notify-send "Recording resumed"
        fi
        ;;
    " Stop Recording")
        if [ -f "$PID_FILE" ]; then
            PID=$(cat "$PID_FILE")
            kill -TERM $PID
            # Wait for ffmpeg to exit (max 3 seconds)
            for i in {1..6}; do
                kill -0 $PID 2>/dev/null || break
                sleep 0.5
            done
            # Force kill if still running
            kill -9 $PID 2>/dev/null
            rm -f "$PID_FILE" "$PAUSE_FILE"
            notify-send "Recording stopped" "Saved to $OUTPUT_DIR/"
        fi
        ;;
esac

# // --- Uncomment this if you are on wayland --- //

: <<'COMMENT'
# // -- variables -- //
OUTPUT_DIR="$HOME/Videos/Screen-recordings"
PAUSE_FILE="/tmp/wf-recorder-paused"

# // -- Create output directory if it doesn't exist -- //
mkdir -p "$OUTPUT_DIR"

# // -- Check recording status -- //
if pgrep -x "wf-recorder" > /dev/null; then
    if [ -f "$PAUSE_FILE" ]; then
        OPTIONS=" Resume Recording\n Stop Recording"
    else
        OPTIONS=" Pause Recording\n Stop Recording"
    fi
else
    OPTIONS=" Start Full Screen\n Start Area Selection\n Start Window"
fi

# // -- Show menu -- //
# Note: the space in the prompt "capture screen" is necessary for it to look centered, change at ur own risk
SELECTION=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "        Record Screen" \
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

# // -- Do operations based on what user selected -- //
case "$SELECTION" in
    " Start Full Screen")
        FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
        wf-recorder -f "$FILENAME" &
        sleep 0.5
        [ -f "$PAUSE_FILE" ] && rm "$PAUSE_FILE"
        notify-send "Recording started" "Full screen"
        ;;
    " Start Area Selection")
        FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
        wf-recorder -g "$(slurp)" -f "$FILENAME" &
        sleep 0.5
        [ -f "$PAUSE_FILE" ] && rm "$PAUSE_FILE"
        notify-send "Recording started" "Selected area"
        ;;
    " Start Window")
        FILENAME="$OUTPUT_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
        # - Get window geometry -
        GEOM=$(niri msg --json focused-window | jq -r '"\(.x),\(.y) \(.width)x\(.height)"')
        wf-recorder -g "$GEOM" -f "$FILENAME" &
        sleep 0.5
        [ -f "$PAUSE_FILE" ] && rm "$PAUSE_FILE"
        notify-send "Recording started" "Current window"
        ;;
    " Pause Recording")
        pkill -STOP wf-recorder
        touch "$PAUSE_FILE"
        notify-send "Recording paused" "Resume from menu"
        ;;
    " Resume Recording")
        pkill -CONT wf-recorder
        rm -f "$PAUSE_FILE"
        notify-send "Recording resumed"
        ;;
    " Stop Recording")
        # - Try graceful stop first, then force if needed -
        pkill -TERM wf-recorder
        rm -f "$PAUSE_FILE"
        # - Wait for wf-recorder to exit (max 3 seconds) -
        for i in {1..6}; do
            pgrep -x "wf-recorder" > /dev/null || break
            sleep 0.5
        done
        # - Force kill if still running -
        pkill -9 wf-recorder 2>/dev/null
        notify-send "Recording stopped" "Saved to $OUTPUT_DIR/"
        ;;
esac
COMMENT
