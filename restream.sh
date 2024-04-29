#!/bin/bash

# Function to handle termination
cleanup() {
    echo "Stopping script..."
    exit 0
}

# Trap the termination signal (Ctrl + C)
trap cleanup INT

# Main loop
ffmpeg -i rtsp://127.0.0.1:8800/1 -c:v copy -f rtsp -rtsp_transport tcp rtsp://127.0.0.1:8554/camera1 &
ffmpeg -i rtsp://127.0.0.1:8800/2 -c:v copy -f rtsp -rtsp_transport tcp rtsp://127.0.0.1:8554/camera2 &

