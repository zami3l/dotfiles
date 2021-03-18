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

    echo "Installation prerequisites: Autojump and Zsh"

    if [[ ${os} == "arch" ]]; then
        sudo pacman -S autojump zsh
    elif [[ ${os} == "debian" ]]; then
        sudo apt install autojump zsh
    elif [[ ${os} == "redhat" ]]; then
        sudo dnf install autojump autojump-zsh zsh
    fi

    echo "Installation: OhMyZsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Installation: Themes powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    echo "Installation: Zsh Syntax"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-synta

    echo "Installation: Zsh Autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    echo "Copy file configuration"
    cp .zshrc $HOME/

    echo "Installation complete.."
    echo "Please, use -> p10k configure"

}

main() {
    install
}

main
