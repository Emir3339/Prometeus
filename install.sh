#!/bin/bash

success=true

if ! apt install python-pip -y; then
    success=false
fi

if [ "$success" = true ]; then
    python3 -m pip -V;

    if ! apt install -y software-properties-common; then
        success=false
    fi

    if [ "$success" = true ]; then
        apt-add-repository --yes --update ppa:ansible/ansible;
        apt install -y ansible;

        if ! apt install docker-compose -y; then
            success=false
        fi

        if [ "$success" = true ]; then
            docker-compose -f docker-compose1.yaml up -d;
        fi
    fi
fi

if [ "$success" = true ]; then
    echo "Installation complete."
else
    echo "Installation failed. Aborting."
fi
