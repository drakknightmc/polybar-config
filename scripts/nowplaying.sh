#!/bin/bash

info=$(playerctl metadata --format '{{ playerName }}: {{ artist }} - {{ title }}' 2>/dev/null)

if [ -z "$info" ]; then
    echo "No media playing"
else
    # Trim to 50 chars, add ellipsis if needed
    length=${#info}
    if [ "$length" -gt 50 ]; then
        echo "${info:0:47}..."
    else
        echo "$info"
    fi
fi