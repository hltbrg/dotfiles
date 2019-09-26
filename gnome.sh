#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

function run-in-user-session() {
    _display_id=":$(find /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"
    _username=$(who | grep "\(${_display_id}\)" | awk '{print $1}')
    _user_id=$(id -u "$_username")
    _environment=("DISPLAY=$_display_id" "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$_user_id/bus")
    sudo -Hu "$_username" env "${_environment[@]}" "$@"
}

setup_gnome() {
    run-in-user-session gsettings set org.gnome.desktop.calendar show-weekdate true
    run-in-user-session gsettings set org.gnome.shell favorite-apps ['brave-browser.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'sublime-text_subl.desktop']
    run-in-user-session gsettings set org.gnome.shell.app-switcher current-workspace-only true
    wget -O /usr/share/backgrounds/background.jpg "https://avante.biz/wp-content/uploads/Gradient-Wallpaper/Gradient-Wallpaper-009.jpg"
    run-in-user-session gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/background.jpg'
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

    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'DEFAULT'
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme false
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'minimize'
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock pressure-threshold 50.0
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock minimize-shift true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'launch'
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace true
    run-in-user-session gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true

}

check_is_sudo
setup_gnome > /dev/null
install_gnome_extensions > /dev/null
install_dash_to_dock > /dev/null
