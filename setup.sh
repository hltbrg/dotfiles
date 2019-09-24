#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

check_is_sudo
bash ./sublime.sh
bash ./gnome.sh
bash ./zsh.sh
