#!/bin/bash

if ! playerctl --player=spotify status >/dev/null 2>&1; then
    exit 0
fi

status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$status" != "Playing" ] && [ "$status" != "Paused" ]; then
    exit 0
fi

artist=$(playerctl --player=spotify metadata artist 2>/dev/null)
title=$(playerctl --player=spotify metadata title 2>/dev/null)

if [ -z "$title" ]; then
    exit 0
fi

if [ -n "$artist" ]; then
    echo "${artist} — ${title}"
else
    echo "${title}"
fi
