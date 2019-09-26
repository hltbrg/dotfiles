#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

install_brave() {
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    source /etc/os-release
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
    apt-get update
    apt-get install brave-browser
}
install_gimp() {
    add-apt-repository ppa:otto-kesselgulasch/gimp
    apt-get update
    apt-get install -y gimp
}

install_sublime_packages() {
    mkdir ~/.config/sublime-text-3/Installed\ Packages/
    (
        cd ~/.config/sublime-text-3/Installed\ Packages/
        wget --quiet https://packagecontrol.io/Package%20Control.sublime-package
    )

    mkdir ~/.config/sublime-text-3/Packages/User/
    cp -R ~/dotfiles/sublime_settings/. ~/.config/sublime-text-3/Packages/User/
    pip3 install flake8
}

install_sublime() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    apt-get update
    apt-get install -y sublime-text
    install_sublime_packages
}



check_is_sudo
install_brave
install_gimp
install_sublime
