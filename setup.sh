#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

check_is_sudo
bash ~/dotfiles/essentials.sh
bash ~/dotfiles/programs.sh
bash ~/dotfiles/gnome.sh
bash ~/dotfiles/zsh.sh
