#!/bin/bash
temp=$(zenity --entry --title="Set Color Temp (2200-6500K)" --text="Enter Temperature [e.g. 2700]:")
brightness=$(zenity --entry --title="Set Brightness" --text="Enter Brightness [10-100]:")
~/.config/polybar/scripts/wizlights_control.sh temp $temp $brightness