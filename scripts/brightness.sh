#!/bin/bash

# Get brightness percentage (rounded to integer)
get_brightness() {
    brightnessctl g | awk -v max=$(brightnessctl m) '{printf "%d\n", ($1 * 100) / max}'
}

# Notify current brightness
notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Brightness: $(get_brightness)%"
}

# Increase brightness
inc_brightness() {
    brightnessctl s 5%+ && notify_user
}

# Decrease brightness
dec_brightness() {
    brightnessctl s 5%- && notify_user
}

# Toggle min/max (optional utility)
toggle_brightness() {
    current=$(get_brightness)
    if [ "$current" -le 10 ]; then
        brightnessctl s 100% && notify_user
    else
        brightnessctl s 5% && notify_user
    fi
}

# Run based on flag
case "$1" in
    --get)
        get_brightness
        ;;
    --inc)
        inc_brightness
        ;;
    --dec)
        dec_brightness
        ;;
    --toggle)
        toggle_brightness
        ;;
    *)
        echo "Usage: $0 {--get|--inc|--dec|--toggle}"
        exit 1
        ;;
esac
