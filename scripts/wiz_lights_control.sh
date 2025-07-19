#!/bin/bash
# Usage: ./wizlights_control.sh on/off/color temp brightness r g b

BULBS=("192.168.0.123" "192.168.0.154") 

# Defaults
action="\$1"           # 'on', 'off', or 'color'
temp="\$2"             # Color temperature (2200-6500) for white
brightness="\$3"       # 10-100
r="\$4"
g="\$5"
b="\$6"

for IP in "${BULBS[@]}"; do
    case "$action" in
        on)
            echo '{"method":"setPilot","params":{"state":true}}' | nc -w1 -u $IP 38899
            ;;
        off)
            echo '{"method":"setPilot","params":{"state":false}}' | nc -w1 -u $IP 38899
            ;;
        color)
            # Send RGB color + brightness
            echo '{"method":"setPilot","params":{"state":true,"r":'"$r"',"g":'"$g"',"b":'"$b"',"dimming":'"$brightness"'}}' | nc -w1 -u $IP 38899
            ;;
        temp)
            # Send color-temp + brightness
            echo '{"method":"setPilot","params":{"state":true,"temp":'"$temp"',"dimming":'"$brightness"'}}' | nc -w1 -u $IP 38899
            ;;
        *)
            echo "Usage: \$0 on|off|color <temp> <brightness> <r> <g> <b>"
            echo "Or: \$0 temp <temp> <brightness>"
            exit 1
            ;;
    esac
done