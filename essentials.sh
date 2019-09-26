#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

check_is_sudo
apt-get update
apt-get install -y apt-transport-https curl
apt-get install -y python3-pip
pip3 install pipenv
