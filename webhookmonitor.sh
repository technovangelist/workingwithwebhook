#!/bin/bash

# Define paths and commands
WEBHOOK_EXECUTABLE="/opt/homebrew/bin/webhook"
WEBHOOK_CONFIG="path to hooks.json"
WEBHOOK_COMMAND="$WEBHOOK_EXECUTABLE -hooks $WEBHOOK_CONFIG -verbose"

# Function to start webhook
start_webhook() {
    echo "$(date): Starting webhook service with command: $WEBHOOK_COMMAND"
    $WEBHOOK_COMMAND > /tmp/webhook.log 2>&1 &
    echo "$(date): Webhook service started with PID: $!"
}

# Function to stop webhook
stop_webhook() {
    echo "$(date): Stopping webhook service"
    pkill -f "$WEBHOOK_EXECUTABLE.*$WEBHOOK_CONFIG"
    sleep 2
}

# Function to restart webhook
restart_webhook() {
    echo "$(date): Restarting webhook service"
    stop_webhook
    start_webhook
}

# Initial start
start_webhook

# Monitor for changes
echo "$(date): Monitoring $WEBHOOK_CONFIG for changes"
/opt/homebrew/bin/fswatch -o "$WEBHOOK_CONFIG" | while read
do
    echo "$(date): Change detected in $WEBHOOK_CONFIG"
    restart_webhook
done