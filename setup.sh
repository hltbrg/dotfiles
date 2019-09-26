#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

check_is_sudo
bash ./essentials.sh
bash ./programs.sh
bash ./gnome.sh
bash ./zsh.sh
