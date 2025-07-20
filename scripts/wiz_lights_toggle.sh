#!/bin/bash

logfile="/tmp/wiz_toggle.log"
echo "Toggle clicked at $(date)" >> "$logfile"

# Get status as JSON from n8n
response=$(curl -s "https://n8n.cap.drak.work/webhook/wiz/all")
current_status=$(echo "$response" | jq -r '.[0].stdout')

echo "Current status: $current_status" >> "$logfile"

# Determine toggle state
if [[ "$current_status" == "true" ]]; then
    new_state="false"
else
    new_state="true"
fi

# Send new state to webhook
toggle_response=$(curl -s "https://n8n.cap.drak.work/webhook/d7036b49-f326-43cf-95eb-f54a38496ab0/wiz/all/$new_state")

echo "Sent new state: $new_state" >> "$logfile"
echo "Response from webhook: $toggle_response" >> "$logfile"
