#!/usr/bin/env bash

# // -- Uncomment for oxwm -- //

CONFIG_FILE="$HOME/.config/oxwm/config.lua"
LABELS_FILE="$HOME/.config/rofi/scripts/keybind-labels.conf"
TEMP_FILE="/tmp/oxwm-keybinds.txt"

# // -- Load labels -- //
declare -A LABELS
while IFS='|' read -r script label; do
    [[ "$script" =~ ^#.*$ ]] && continue
    [[ -z "$script" ]] && continue
    LABELS["$script"]="$label"
done < "$LABELS_FILE"

> "$TEMP_FILE"

awk '
/oxwm\.key\.bind/ {
    buffer = $0
    while (buffer !~ /\)\)$/ && getline > 0) {
        buffer = buffer " " $0
    }
    print buffer
}
' "$CONFIG_FILE" | while read -r line; do
    # Extract: modifiers, key, and action
    if [[ "$line" =~ oxwm\.key\.bind\(\{([^\}]*)\}[[:space:]]*,[[:space:]]*\"([^\"]+)\"[[:space:]]*,(.+)\)\) ]]; then
        mods="${BASH_REMATCH[1]}"
        key="${BASH_REMATCH[2]}"
        action="${BASH_REMATCH[3]}"

        # Simple cleanup
        mods="${mods//modkey/Super}"
        mods="${mods//Mod4/Super}"
        mods="${mods//Mod1/Alt}"
        mods="${mods//modkey2/Alt}"
        mods="${mods//,/+}"
        mods="${mods//\"/}"
        mods="${mods// /}"

        # Format key combo
        if [ -z "$mods" ]; then
            combo="$key"
        else
            combo="$mods+$key"
        fi

        # Try to match against labels
        label=""
        for script in "${!LABELS[@]}"; do
            if [[ "$action" == *"$script"* ]]; then
                label="${LABELS[$script]}"
                break
            fi
        done

        # If no label found, show raw action
        if [ -z "$label" ]; then
            label="$action"
        fi

        echo "$combo ⇒ $label" >> "$TEMP_FILE"
    fi
done

sort -u "$TEMP_FILE" | rofi -dmenu -i -p "  Keybindings" \
    -theme-str 'window { width: 600px; } listview { columns: 1; }'

rm -f "$TEMP_FILE"

# // -- Uncomment for niri -- //

: <<'COMMENT'
# // -- variables -- //
KEYBINDS_DIR="$HOME/.config/niri/Keybindings"
LABELS_FILE="$HOME/.config/rofi/scripts/keybind-labels.conf"
TEMP_FILE="/tmp/niri-keybinds.txt"

# // -- Load labels into associative array -- //
declare -A LABELS
while IFS='|' read -r script label; do
    [[ "$script" =~ ^#.*$ ]] && continue
    [[ -z "$script" ]] && continue
    LABELS["$script"]="$label"
done < "$LABELS_FILE"

# // -- clear temp file -- //
> "$TEMP_FILE"

# // -- Function to clean up action names -- //
clean_action() {
    local action="$1"

    # Try to match against our labels
    for script in "${!LABELS[@]}"; do
        if [[ "$action" == *"$script"* ]]; then
            echo "${LABELS[$script]}"
            return
        fi
    done

    # Common patterns if no label found
    case "$action" in
        *"wpctl set-volume"*"5%+"*|*"wpctl set-volume"*"0.1+"*) echo "Volume Up" ;;
        *"wpctl set-volume"*"5%-"*|*"wpctl set-volume"*"0.1-"*) echo "Volume Down" ;;
        *"wpctl set-mute"*"SINK"*"toggle"*) echo "Mute Audio" ;;
        *"wpctl set-mute"*"SOURCE"*"toggle"*) echo "Mute Mic" ;;
        *"playerctl play-pause"*) echo "Play/Pause" ;;
        *"playerctl stop"*) echo "Stop" ;;
        *"playerctl previous"*) echo "Previous Track" ;;
        *"playerctl next"*) echo "Next Track" ;;
        *"brightnessctl set 5%+"*) echo "Brightness Up" ;;
        *"brightnessctl set 5%-"*) echo "Brightness Down" ;;
        *) echo "$action" ;;
    esac
}

# //  -- Function to extract and format keybinds from a file -- //
parse_keybinds() {
    local file="$1"

    while IFS= read -r line; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*// ]] && continue
        [[ -z "$line" ]] && continue

        # Match keybinds with spawn or spawn-sh
        if [[ "$line" =~ ^[[:space:]]*([A-Za-z0-9+_-]+)[[:space:]]+.*spawn(-sh)?[[:space:]]+\"([^\"]+)\" ]]; then
            key="${BASH_REMATCH[1]}"
            action="${BASH_REMATCH[3]}"
            cleaned=$(clean_action "$action")
            echo "$key: $cleaned" >> "$TEMP_FILE"
        # Match other actions
        elif [[ "$line" =~ ^[[:space:]]*([A-Za-z0-9+_-]+)[[:space:]]+\{[[:space:]]*(close-window|quit|fullscreen) ]]; then
            key="${BASH_REMATCH[1]}"
            action="${BASH_REMATCH[2]}"
            case "$action" in
                close-window) echo "$key: Close window" >> "$TEMP_FILE" ;;
                quit) echo "$key: Quit niri" >> "$TEMP_FILE" ;;
                fullscreen) echo "$key: Toggle fullscreen" >> "$TEMP_FILE" ;;
            esac
        # Match focus/move directions
        elif [[ "$line" =~ ^[[:space:]]*([A-Za-z0-9+_-]+)[[:space:]]+\{[[:space:]]*focus-(left|right|up|down) ]]; then
            key="${BASH_REMATCH[1]}"
            direction="${BASH_REMATCH[2]}"
            echo "$key: Focus $direction" >> "$TEMP_FILE"
        elif [[ "$line" =~ ^[[:space:]]*([A-Za-z0-9+_-]+)[[:space:]]+\{[[:space:]]*move-(left|right|up|down) ]]; then
            key="${BASH_REMATCH[1]}"
            direction="${BASH_REMATCH[2]}"
            echo "$key: Move $direction" >> "$TEMP_FILE"
        fi
    done < "$file"
}

# // -- Parse all keybind files -- //
for file in "$KEYBINDS_DIR"/*.kdl; do
    if [ -f "$file" ]; then
        parse_keybinds "$file"
    fi
done

# // --  rofi menu -- //
sort -u "$TEMP_FILE" | rofi -dmenu -i \
    -p "  Keybindings" \
    -theme-str 'window { width: 600px; } listview { columns: 1; }'

# // -- cleanup -- //
rm -f "$TEMP_FILE"
COMMENT
