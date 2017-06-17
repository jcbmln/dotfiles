#!/bin/bash

# https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh

# Get all dotfiles and any missing tools need for a complete environment.

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
NORMAL="$(tput sgr0)"

DOTFILES="~/.dotfiles"

get_zsh() {
    echo "${YELLOW}Installing zsh...\n"

    if [ ! $(grep /zsh$ /etc/shells | wc -l) -ge 1 ]; then
        sudo apt -y install zsh
        echo "${GREEN}Installation complete.\n"
    else
        echo "${BLUE}Zsh is already installed.\n"
    fi

    echo "${YELLOW}Changing default shell...\n"

    if [[ ! $(echo $SHELL) == $(grep /zsh$ /etc/shells | tail -1) ]]; then
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
        echo "${GREEN}Default shell changed.\n"
    else
        echo "${BLUE}Zsh is already the default shell.\n"
    fi
}

get_git() {
    echo "${YELLOW}Installing git...\n"

    if [ ! $(git --version 2>&1 >/dev/null) -eq 0 ]; then
        sudo apt -y install git
        echo "${GREEN}Installation complete.\n"
    else
        echo "${BLUE}Git is already installed.\n"
    fi
}

clone_dotfiles() {
    echo "${YELLOW}Cloning dotfiles into ${DOTFILES}\n"

    env git clone --depth=1 https://jcbmln@gitlab.com/jcbmln/dotfiles.git $DOTFILES || {
        echo "${RED}Error: git clone failed\n"
        exit 1
    }
}

get_zsh
get_git
clone_dotfiles
