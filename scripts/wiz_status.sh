#!/bin/bash

response=$(curl -s "https://n8n.cap.drak.work/webhook/wiz/all")
status=$(echo "$response" | jq -r '.[0].stdout')

if [ "$status" == "true" ]; then
    echo "💡 ON"
else
    echo "💡 OFF"
fi
