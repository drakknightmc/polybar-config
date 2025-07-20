#!/bin/bash

# Path to the light status script
status_script="~/.config/polybar/scripts/wiz_status.sh"

# Get current status text ("💡 ON" or "🌑 OFF")
current_status=$($status_script)

# Parse ON/OFF and map to true/false
if [[ "$current_status" == *"ON" ]]; then
    new_state="false"  # Light is on → turn it off
else
    new_state="true"   # Light is off → turn it on
fi

# Send toggle command to n8n webhook
curl -s "https://n8n.cap.drak.work/webhook/d7036b49-f326-43cf-95eb-f54a38496ab0/wiz/all/$new_state"
