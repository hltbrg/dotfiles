#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

install_gnome_extensions() {
    apt-get install -y gnome-tweak-tool
    apt-get install -y gnome-shell-extensions
    apt-get install -y chrome-gnome-shell
    wget -O ~/dotfiles/gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
    chmod +x ~/dotfiles/gnome-shell-extension-installer
    mv ~/dotfiles/gnome-shell-extension-installer /usr/bin/
}

install_dash_to_dock() {
    gnome-shell-extension-installer 307 --yes

    gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'DEFAULT'
    gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme false
    gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
    gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
    gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
    gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'minimize'
    gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
    gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview true
    gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false
    gsettings set org.gnome.shell.extensions.dash-to-dock pressure-threshold 50.0
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
    gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
    gsettings set org.gnome.shell.extensions.dash-to-dock minimize-shift true
    gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'launch'
    gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40
    gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
    gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show true
    gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace true
    gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true

}

check_is_sudo
install_gnome_extensions > /dev/null
install_dash_to_dock > /dev/null
