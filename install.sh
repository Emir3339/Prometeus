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
        ansible --version;

        if ! apt install docker-compose -y; then
            success=false
        fi

        if [ "$success" = true ]; then
            docker-compose -f docker-compose.yaml up -d;
        fi
    fi
fi

if [ "$success" = true ]; then
    echo "complete"
else
    echo "Installation failed. Aborting."
fi
