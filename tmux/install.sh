#!/bin/bash

check_os() {

    if grep -q "Arch" /etc/issue; then
        echo arch
    elif grep -q "Debian" /etc/issue; then
        echo debian
    else
        echo redhat
    fi

}

install() {

    os=$(check_os)

    echo "OS : ${os}"

    echo "Installation: Tmux"

    if [[ ${os} == "arch" ]]; then
        sudo pacman -S tmux
    elif [[ ${os} == "debian" ]]; then
        sudo apt install tmux
    elif [[ ${os} == "redhat" ]]; then
        sudo dnf install tmux
    fi

    echo "Create folder : Plugins"
    mkdir -p $HOME/.tmux/plugins

    echo "Add plugin : TPM"
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

    echo "Add plugin : Tmux yank"
    git clone https://github.com/tmux-plugins/tmux-yank $HOME/.tmux/plugins/tmux-yank

    cp .tmux.conf $HOME/

}

main() {
    install
}

main
