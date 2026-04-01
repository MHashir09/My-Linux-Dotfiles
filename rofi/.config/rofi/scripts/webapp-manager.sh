#!/bin/bash

BROWSER="helium-browser"
APPS_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons/webapps"

get_webapps() {
    grep -rl "$BROWSER --app=" "$APPS_DIR" 2>/dev/null
}

get_webapp_names() {
    while IFS= read -r f; do
        grep "^Name=" "$f" | cut -d= -f2
    done < <(get_webapps)
}

get_file_by_name() {
    local name="$1"
    grep -rl "^Name=$name" "$APPS_DIR" 2>/dev/null | head -1
}

notify() {
    dunstify "Webapp Manager" "$1"
}

normalize_url() {
    local url="$1"
    if [[ "$url" != http://* && "$url" != https://* ]]; then
        url="https://www.$url"
    fi
    echo "$url"
}

validate_url() {
    local url="$1"
    local notif_id=9999
    dunstify -r $notif_id "Webapp Manager" "Validating URL, please wait..."
    if ! curl -sL --max-time 5 --head "$url" | grep -q "HTTP/"; then
        dunstify -r $notif_id "Webapp Manager" "Invalid or unreachable URL: $url"
        return 1
    fi
    dunstify -r $notif_id "Webapp Manager" "URL looks good!"
    return 0
}

summon_webapp() {
    NAME=$(rofi -dmenu -p "  Enter the name of web-app   " -lines 0 \
        -theme-str '
            window {
                width: 650px;
                height: 50px;
            }
            mainbox { padding: -1px; }
            inputbar {
                children: [prompt, entry];
                padding: 12px 20px;
            }
            entry {
                expand: true;
                placeholder: "e.g. YouTube";
            }
        ')
    [ -z "$NAME" ] && return

    URL=$(rofi -dmenu -p "  Enter the URL   " -lines 0 \
        -theme-str '
            window {
                width: 750px;
                height: 50px;
            }
            mainbox { padding: -1px; }
            inputbar {
                children: [prompt, entry];
                padding: 12px 30px;
            }
            entry {
                expand: true;
                placeholder: "e.g. youtube.com or https://www.youtube.com";
            }
        ')
    [ -z "$URL" ] && return

    URL=$(normalize_url "$URL")
    validate_url "$URL" || return

    FILENAME=$(echo "$NAME" | tr ' ' '-')
    mkdir -p "$ICON_DIR"
    curl -sL "https://www.google.com/s2/favicons?domain=$URL&sz=128" -o "$ICON_DIR/$FILENAME.png"
    cat > "$APPS_DIR/$FILENAME.desktop" <<EOF
[Desktop Entry]
Name=$NAME
Exec=$BROWSER --app=$URL --window-decorations=false
Icon=$ICON_DIR/$FILENAME.png
Type=Application
Categories=Network;
EOF
    notify "Webapp '$NAME' created!"
}

remove_webapp() {
    NAMES=$(get_webapp_names)
    if [ -z "$NAMES" ]; then
        notify "No webapps found"
        return
    fi

    SELECTED=$(echo "$NAMES" | rofi -dmenu -p "  Remove Webapps" \
      -theme-str '
         window {
            width: 260px;
            x-offset: 0;
            y-offset: 0;
         }
        inputbar {
            children: [prompt];
        }
        textbox-prompt-colon {
            enabled: false;
        }
        entry {
            enabled: false;
        }
        element-text {
            horizontal-align: 0;
        }
      ')
    [ -z "$SELECTED" ] && return

    FILE=$(get_file_by_name "$SELECTED")
    FILENAME=$(echo "$SELECTED" | tr ' ' '-')
    rm -f "$FILE"
    rm -f "$ICON_DIR/$FILENAME.png"
    notify "Webapp '$SELECTED' removed!"
}

migrate_webapps() {
    declare -A BROWSERS=(
        ["Google Chrome"]="google-chrome-stable"
        ["Chromium"]="chromium"
        ["Helium Browser"]="helium-browser"
        ["Ungoogled Chromium"]="ungoogled-chromium"
        ["Brave"]="brave"
        ["Vivaldi"]="vivaldi"
        ["Microsoft Edge"]="microsoft-edge"
    )

    DISPLAY_NAMES=()
    BINARIES=()

    for BNAME in "${!BROWSERS[@]}"; do
        BINARY="${BROWSERS[$BNAME]}"
        if command -v "$BINARY" &>/dev/null; then
            DISPLAY_NAMES+=("$BNAME")
            BINARIES+=("$BINARY")
        fi
    done

    if [ ${#DISPLAY_NAMES[@]} -eq 0 ]; then
        notify "No supported Chromium browsers found installed"
        return
    fi

    SELECTED=$(printf "%s\n" "${DISPLAY_NAMES[@]}" | rofi -dmenu -i -p "   Select Browser" \
        -theme-str '
            window {
                width: 280px;
                x-offset: 0;
                y-offset: 0;
            }
            inputbar {
                children: [prompt];
            }
            textbox-prompt-colon {
                enabled: false;
            }
            entry {
                enabled: false;
            }
        ')
    [ -z "$SELECTED" ] && return

    NEW_BINARY=""
    for i in "${!DISPLAY_NAMES[@]}"; do
        if [ "${DISPLAY_NAMES[$i]}" = "$SELECTED" ]; then
            NEW_BINARY="${BINARIES[$i]}"
            break
        fi
    done

    COUNT=0
    while IFS= read -r f; do
        sed -i "s|Exec=$BROWSER --app=|Exec=$NEW_BINARY --app=|g" "$f"
        COUNT=$((COUNT + 1))
    done < <(grep -rl "$BROWSER --app=" "$APPS_DIR" 2>/dev/null)

    BROWSER="$NEW_BINARY"
    notify "Migrated $COUNT webapp(s) to $SELECTED!"
}

modify_webapp() {
    ACTION=$(printf "Change Name\nChange URL\nMigrate WebApps" | rofi -dmenu -i -p "   Modify WebApps" \
    -theme-str '
        window {
            width: 280px;
            x-offset: 0;
            y-offset: 0;
        }
        inputbar {
            children: [prompt];
        }
        textbox-prompt-colon {
            enabled: false;
        }
        entry {
            enabled: false;
        }
    ')
    [ -z "$ACTION" ] && return

    if [ "$ACTION" = "Migrate WebApps" ]; then
        migrate_webapps
        return
    fi

    NAMES=$(get_webapp_names)
    if [ -z "$NAMES" ]; then
        notify "No webapps found"
        return
    fi

    SELECTED=$(echo "$NAMES" | rofi -dmenu -p "   Select Webapp" \
    -theme-str '
        window {
            width: 280px;
            x-offset: 0;
            y-offset: 0;
        }
        inputbar {
            children: [prompt];
        }
        textbox-prompt-colon {
            enabled: false;
        }
        entry {
            enabled: false;
        }
    ')
    [ -z "$SELECTED" ] && return

    FILE=$(get_file_by_name "$SELECTED")
    FILENAME=$(echo "$SELECTED" | tr ' ' '-')

    if [ "$ACTION" = "Change Name" ]; then
        NEW_NAME=$(rofi -dmenu -p "  Enter new name of WebApp   " -lines 0 \
            -theme-str '
              window {
                width: 750px;
                height: 50px;
            }
              mainbox { padding: -1px; }
              inputbar {
                children: [prompt, entry];
                padding: 12px 30px;
            }
            entry {
                expand: true;
                placeholder: "e.g. YouTube";
            }
           ')
        [ -z "$NEW_NAME" ] && return
        NEW_FILENAME=$(echo "$NEW_NAME" | tr ' ' '-')
        sed -i "s/^Name=.*/Name=$NEW_NAME/" "$FILE"
        sed -i "s|Icon=$ICON_DIR/$FILENAME.png|Icon=$ICON_DIR/$NEW_FILENAME.png|" "$FILE"
        mv "$FILE" "$APPS_DIR/$NEW_FILENAME.desktop"
        mv "$ICON_DIR/$FILENAME.png" "$ICON_DIR/$NEW_FILENAME.png" 2>/dev/null
        notify "Renamed to '$NEW_NAME'!"

    elif [ "$ACTION" = "Change URL" ]; then
        NEW_URL=$(rofi -dmenu -p "  Enter new URL of WebApp   " -lines 0 \
           -theme-str '
              window {
                width: 750px;
                height: 50px;
            }
              mainbox { padding: -1px; }
              inputbar {
                children: [prompt, entry];
                padding: 12px 30px;
            }
            entry {
                expand: true;
                placeholder: "e.g. youtube.com or https://www.youtube.com";
            }
           ')
        [ -z "$NEW_URL" ] && return
        NEW_URL=$(normalize_url "$NEW_URL")
        validate_url "$NEW_URL" || return
        sed -i "s|Exec=$BROWSER --app=.* --window-decorations=false|Exec=$BROWSER --app=$NEW_URL --window-decorations=false|" "$FILE"
        curl -sL "https://www.google.com/s2/favicons?domain=$NEW_URL&sz=128" -o "$ICON_DIR/$FILENAME.png"
        notify "URL updated for '$SELECTED'!"
    fi
}

CHOICE=$(printf "Summon Webapp\nRemove Webapp\nModify Webapp" | rofi -dmenu -i -p "    Web-Apps-Man " \
    -theme-str '
        window {
            width: 280px;
            x-offset: 0;
            y-offset: 0;
        }
        inputbar {
            children: [prompt];
        }
        textbox-prompt-colon {
            enabled: false;
        }
        entry {
            enabled: false;
        }
    ')

case "$CHOICE" in
    "Summon Webapp") summon_webapp ;;
    "Remove Webapp") remove_webapp ;;
    "Modify Webapp") modify_webapp ;;
esac
