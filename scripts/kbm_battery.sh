#!/bin/bash

# Get mouse battery via razer-cli
mouse_battery=$(razer-cli -d "Razer DeathAdder V2 X HyperSpeed" -l | grep -oP 'charge:\s*\K\d+')


# # Get keyboard battery via solaar
keyboard_battery=$(solaar show | grep -oP 'Battery:\s*\K\d+' | head -n 1)


# Fallback text if not found
[ -z "$mouse_battery" ] && mouse_battery="N/A"
[ -z "$keyboard_battery" ] && keyboard_battery="N/A"
if lsusb -s 003:002 | grep -q 'Barracuda'; then
    conn="🎧 Connected"
else
    conn="🎧 Disconnected"
fi
echo "🖱️ $mouse_battery% | ⌨️ $keyboard_battery% | $conn "