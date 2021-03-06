#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

# Install zsh, plugins, and fonts.
install_zsh() {

#    (
#        git clone https://github.com/ryanoasis/nerd-fonts.git
#        cd ${HOME}/nerd-fonts
#        ./install.sh RobotoMono
#    ) &
    (
        mkdir -p ~/.local/share/fonts
        cd ~/.local/share/fonts
        curl -fLo "UbuntuMono Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf?raw=true
    )


    apt-get update > /dev/null || true
    apt-get install -y \
        wget \
        zsh \
        powerline \
        fonts-powerline \
        zsh-syntax-highlighting

    usermod -s $(which zsh) $(whoami)

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

    ln -svf ~/dotfiles/.zshrc ~
    dconf load /org/gnome/terminal/ < ~/dotfiles/gnome_terminal_settings_zsh.txt


}
check_is_sudo
install_zsh > /dev/null
