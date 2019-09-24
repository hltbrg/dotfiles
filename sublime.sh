#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

install_sublime() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    apt-get install -y apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    apt-get update
    apt-get install -y sublime-text
}

install_packages() {
    mkdir ~/.config/sublime-text-3/Installed\ Packages/
    (
        cd ~/.config/sublime-text-3/Installed\ Packages/
        wget --quiet https://packagecontrol.io/Package%20Control.sublime-package
    )

    mkdir ~/.config/sublime-text-3/Packages/User/
    cp -R ~/dotfiles/sublime_settings/. ~/.config/sublime-text-3/Packages/User/
    pip3 install flake8
}


check_is_sudo
install_sublime > /dev/null
install_packages > /dev/null
