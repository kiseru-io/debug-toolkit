#!/usr/bin/env bash

PORT=80
TIMEOUT=300

echo "Starting listener on port ${PORT}. Pod will exit after ${TIMEOUT}s of inactivity."

while true; do
    if timeout $TIMEOUT nc -l -p $PORT; then
        echo "Connection handled, resetting inactivity timer."
    else
        echo "No connection for ${TIMEOUT}s. Exiting container."
        exit 0
    fi
done
