#!/bin/bash

# Get Output (Sink) Volume
get_volume() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
    volume=$(( ${volume%.*} * 100 + 10#${volume#*.} ))
    echo "$volume"
}

# Send Output Notification
notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Volume: $(get_volume)%"
}

# Increase Output Volume
inc_volume() {
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && notify_user
}

# Decrease Output Volume
dec_volume() {
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify_user
}

# Toggle Output Mute
toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Volume Muted"
    else
        notify_user
    fi
}

# --- Microphone (Source) Functions ---

# Get Microphone Volume
get_mic_volume() {
    mic_volume=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2}')
    mic_volume=$(( ${mic_volume%.*} * 100 + 10#${mic_volume#*.} ))
    echo "$mic_volume"
}

# Send Microphone Notification
notify_mic() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Mic Volume: $(get_mic_volume)%"
}

# Increase Microphone Volume
inc_mic_volume() {
    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+ && notify_mic
}

# Decrease Microphone Volume
dec_mic_volume() {
    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%- && notify_mic
}

# Toggle Microphone Mute
toggle_mic_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED; then
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Mic Muted"
    else
        notify_mic
    fi
}

# --- Execute Accordingly ---
case "$1" in
    --get)
        get_volume
        ;;
    --inc)
        inc_volume
        ;;
    --dec)
        dec_volume
        ;;
    --toggle)
        toggle_mute
        ;;
    --mic-get)
        get_mic_volume
        ;;
    --mic-inc)
        inc_mic_volume
        ;;
    --mic-dec)
        dec_mic_volume
        ;;
    --mic-toggle)
        toggle_mic_mute
        ;;
    *)
        echo "Usage: $0 {--get|--inc|--dec|--toggle|--mic-get|--mic-inc|--mic-dec|--mic-toggle}"
        exit 1
        ;;
esac
