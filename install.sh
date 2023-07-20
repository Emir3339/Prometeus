#!/bin/bash

success=true

if ! apt install docker-compose -y; then
    success=false
fi

if systemctl start docker; then
    echo "Service started successfully."
    systemctl status docker
    status=$(systemctl is-active docker)
    if [ "$status" = "active" ]; then
    else
       echo "Service is not active. Aborting."
    fi
else
    echo "Failed to start service. Aborting."
fi

if [ "$success" = true ]; then
    docker-compose -f docker-compose1.yaml up -d
    echo "Installation complete."
else
    echo "Installation failed. Aborting."
fi
