#!/bin/bash

WALLPAPER=$(find ~/Pictures/wallpapers -type f | shuf -n 1)
feh --bg-fill "$WALLPAPER"
wal -i "$WALLPAPER"
~/.config/polybar/scripts/pywal.sh
~/.config/polybar/launch.sh