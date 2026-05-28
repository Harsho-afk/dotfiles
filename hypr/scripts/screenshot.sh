#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

mkdir -p "$DIR"

case "$1" in
    area)
        grim -g "$(slurp -d)" "$FILE"
        ;;
    full)
        grim "$FILE"
        ;;
    window)
        grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" "$FILE"
        ;;
esac

if [ -f "$FILE" ]; then
    wl-copy < "$FILE"
    dunstify -i "$FILE" "Screenshot Saved" "$(basename "$FILE")"
fi
