#!/bin/bash

apt install python-pip -y
python3 -m pip -V
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible
ansible --version
apt install docker-compose -y

echo "complete"
