#!/bin/bash

# Function to handle termination
cleanup() {
    echo "Stopping script..."
    exit 0
}

# Trap the termination signal (Ctrl + C)
trap cleanup INT

# Main loop
ffmpeg -re -stream_loop -1 -i road.mp4 -vcodec copy -an -f rtsp -rtsp_transport tcp rtsp://127.0.0.1:8800/1 &
ffmpeg -re -stream_loop -1 -i winter.mp4 -vcodec copy -an -f rtsp -rtsp_transport tcp rtsp://127.0.0.1:8800/2 &

