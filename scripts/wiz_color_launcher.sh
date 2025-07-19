#!/bin/bash
color=$(yad --color --title "Pick a Color" --button=gtk-ok)
if [ -z "$color" ]; then exit 0; fi
# color output is like '#RRGGBB'
r=$((0x${color:1:2}))
g=$((0x${color:3:2}))
b=$((0x${color:5:2}))
~/.config/polybar/scripts/wizlights_control.sh color "" 100 $r $g $b