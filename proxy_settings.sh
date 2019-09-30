#!/bin/bash

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}


set_up_volvo_proxy() {
    export {http,https,ftp}_proxy="http://cloudpxgot1.srv.volvo.com:8080"
    export no_proxy="localhost,127.0.0.0/8,::1,.volvo.net,.volvo.org,.volvo.com"

    bash ~/dotfiles/PropUpdate.sh /etc/environment http_proxy "http://cloudpxgot1.srv.volvo.com:8080"
    bash ~/dotfiles/PropUpdate.sh /etc/environment https_proxy "http://cloudpxgot1.srv.volvo.com:8080"
    bash ~/dotfiles/PropUpdate.sh /etc/environment ftp_proxy "http://cloudpxgot1.srv.volvo.com:8080"
    bash ~/dotfiles/PropUpdate.sh /etc/environment no_proxy "localhost,127.0.0.1,::1,.volvo.net,.volvo.org,.volvo.com"

    bash ~/dotfiles/PropUpdate.sh /etc/apt/apt.conf Acquire::http::proxy '"http://cloudpxgot1.srv.volvo.com:8080";'
    bash ~/dotfiles/PropUpdate.sh /etc/apt/apt.conf Acquire::https::proxy '"http://cloudpxgot1.srv.volvo.com:8080";'
    bash ~/dotfiles/PropUpdate.sh /etc/apt/apt.conf Acquire::ftp::proxy '"http://cloudpxgot1.srv.volvo.com:8080";'

    bash ~/dotfiles/PropUpdate.sh /etc/pip.conf http_proxy "= http://cloudpxgot1.srv.volvo.com:8080"
    bash ~/dotfiles/PropUpdate.sh /etc/pip.conf https_proxy "= http://cloudpxgot1.srv.volvo.com:8080"
}


if [[ "$SUDO_USER" == "simuser" ]] || [[ "$SUDO_USER" == "a311604" ]]; then
        set_up_volvo_proxy
fi
