#!/bin/bash
STATE="/tmp/lmb_held"
if [ -f "$STATE" ]; then
    ydotool click 0x80   # release left button
    rm -f "$STATE"
else
    ydotool click 0x40   # hold left button down
    touch "$STATE"
fi
