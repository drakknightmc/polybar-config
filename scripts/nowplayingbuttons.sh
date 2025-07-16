#!/bin/bash

title=$(playerctl metadata --format '{{ title }}' 2>/dev/null)
artist=$(playerctl metadata --format '{{ artist }}' 2>/dev/null)

if [ -z "$title" ]; then
    info="No media playing"
elif [ ${#title} -gt 15 ]; then
    info="$title"
else
    info="$title : $artist"
fi

status=$(playerctl status 2>/dev/null)

prev="%{T1}玲%{T-}"
next="%{T1}怜%{T-}"

if [[ "$status" == "Playing" ]]; then
    play="%{T1}%{T-}"   # Pause icon
else
    play="%{T1}%{T-}"   # Play icon
fi

# Output: info first, then clickable controls
echo "$info %{A1:playerctl previous:}$prev%{A} %{A1:playerctl play-pause:}$play%{A} %{A1:playerctl next:}$next%{A}"