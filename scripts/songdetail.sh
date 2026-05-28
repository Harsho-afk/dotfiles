#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
    exit 0
fi

status=$(playerctl --player="$player" status 2>/dev/null)

if [ "$status" != "Playing" ] && [ "$status" != "Paused" ]; then
    exit 0
fi

artist=$(playerctl --player="$player" metadata artist 2>/dev/null)
title=$(playerctl --player="$player" metadata title 2>/dev/null)

if [ -z "$title" ]; then
    exit 0
fi

if [ "$status" = "Paused" ]; then
    icon=" "
else
    icon=" "
fi

if [ -n "$artist" ]; then
    echo "${icon}${artist} — ${title}"
else
    echo "${icon}${title}"
fi
