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

    echo "Installation prerequisites: gnuPG"

    if [[ ${os} == "arch" ]]; then
        sudo pacman -S gnupg
    elif [[ ${os} == "debian" ]]; then
        sudo apt install gnupg
    elif [[ ${os} == "redhat" ]]; then
        sudo dnf install gnupg
    fi

    echo "Copy file configuration"
    cp gpg.conf $HOME/.gnupg/

    echo "Installation complete.."

}

main() {
    install
}

main
