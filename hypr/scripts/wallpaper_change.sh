#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Wallpaper"
HISTORY_FILE="/tmp/.wallpaper_history"

mkdir -p "$(dirname "$HISTORY_FILE")"
touch "$HISTORY_FILE"

mapfile -t ALL_WALLS < <(find "$WALLPAPER_DIR" -type f -name "*.jpg")

TOTAL=${#ALL_WALLS[@]}
HISTORY_SIZE=$(( (TOTAL * 30 + 99) / 100 ))
((HISTORY_SIZE < 1)) && HISTORY_SIZE=1

readarray -t HISTORY < "$HISTORY_FILE"

declare -A HISTORY_MAP
for h in "${HISTORY[@]}"; do
    HISTORY_MAP["$h"]=1
done

AVAILABLE=()
for wp in "${ALL_WALLS[@]}"; do
    [[ -n "${HISTORY_MAP["$wp"]}" ]] || AVAILABLE+=("$wp")
done

if [[ ${#AVAILABLE[@]} -eq 0 ]]; then
    AVAILABLE=("${ALL_WALLS[@]}")
    > "$HISTORY_FILE"
fi

WALLPAPER=$(printf "%s\n" "${AVAILABLE[@]}" | shuf -n 1)

hyprctl hyprpaper wallpaper ",$WALLPAPER,cover"

echo "$WALLPAPER" >> "$HISTORY_FILE"
tail -n "$HISTORY_SIZE" "$HISTORY_FILE" > "$HISTORY_FILE.tmp" && mv "$HISTORY_FILE.tmp" "$HISTORY_FILE"
