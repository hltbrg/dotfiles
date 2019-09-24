#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

install_brave() {
    apt-get install apt-transport-https curl
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    source /etc/os-release
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
    apt-get update
    apt-get install brave-browser
}
install_gimp() {
    sudo add-apt-repository ppa:otto-kesselgulasch/gimp
    sudo apt-get update
    sudo apt-get install gimp
}

install_others() {

}


check_is_sudo
install_brave
install_gimp
install_others
