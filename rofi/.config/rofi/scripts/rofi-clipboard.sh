#!/usr/bin/env bash

# // -- Use rofi-greenclip to use a nice and simple prebuilt clipboard manager -- //
# // -- Install with paru -S rofi-greenclip

# -- Show menu and copy selection --
rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'

# // -- Or you can use a manual approach with the script I made -- //
# // -- Requires cliphist and wl-copy ( Note: This works on wayland only ) -- //

: <<'COMMENT'
# // -- Configuration and variable declarations   -- //
LIMIT=50
declare -A ID_MAP       # Maps display labels to clipboard IDs
declare -a IDS          # Stores clipboard IDs
declare -a IS_IMAGE_ARR # Flags: 1 for image, 0 for text
declare -a CONTENTS     # Stores text content
count=0
total_images=0

# // -- First pass: Collect items and count total images -- //
while IFS= read -r id_line; do
    ID=$(echo "$id_line" | awk '{print $1}')
    CONTENT=$(echo "$id_line" | cut -d' ' -f2-)

    IDS+=("$ID")
    CONTENTS+=("$CONTENT")

    if cliphist decode "$ID" 2>/dev/null | file - 2>/dev/null | grep -q image; then
        IS_IMAGE_ARR+=("1")
        ((total_images++))
    else
        IS_IMAGE_ARR+=("0")
    fi

    ((count++))
    [[ $count -ge $LIMIT ]] && break
done < <(cliphist list --reverse 2>/dev/null)

# // -- Second pass: Build menu with reverse-numbered images -- //
MENU=""
image_num=$total_images

for i in "${!IDS[@]}"; do
    if [[ ${IS_IMAGE_ARR[$i]} -eq 1 ]]; then
        LABEL="[Image #$image_num]"
        ((image_num--))
    else
        LABEL="${CONTENTS[$i]}"
    fi

    ID_MAP["$LABEL"]="${IDS[$i]}"
    MENU+="$LABEL"'\n'
done

# // -- Display menu and get selection -- //
SELECTION=$(echo -e "$MENU" | rofi -dmenu -i -p "Clipboard")
[[ -z "$SELECTION" ]] && exit 0

# // -- Copy selected item to clipboard -- //
cliphist decode "${ID_MAP[$SELECTION]}" 2>/dev/null | wl-copy
notify-send "Clipboard" "Copied to clipboard"
COMMENT
