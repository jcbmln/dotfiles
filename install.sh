#!/bin/bash

# https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh

# Get all dotfiles and any missing tools need for a complete environment.

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
NORMAL="$(tput sgr0)"

DOTFILES="${HOME}/.dotfiles"

get_zsh() {
    echo "${YELLOW}Installing zsh...\n${NORMAL}"

    if [ ! $(grep /zsh$ /etc/shells | wc -l) -ge 1 ]; then
        sudo apt -y install zsh
        echo "${GREEN}Installation complete.\n"
    else
        echo "${BLUE}Zsh is already installed.\n"
    fi

    echo "${YELLOW}Changing default shell...\n${NORMAL}"

    if [ "$(echo $SHELL)" != "$(grep /zsh$ /etc/shells | tail -1)" ]; then
        chsh -s $(grep /zsh$ /etc/shells | tail -1)
        echo "${GREEN}Default shell changed.\n"
    else
        echo "${BLUE}Zsh is already the default shell.\n"
    fi
}

get_git() {
    echo "${YELLOW}Installing git...\n${NORMAL}"

    git --version 2>&1 >/dev/null

    if [ $? -gt 0 ]; then
        sudo apt -y install git
        echo "${GREEN}Installation complete.\n"
    else
        echo "${BLUE}Git is already installed.\n"
    fi
}

clone_dotfiles() {
    echo "${YELLOW}Cloning dotfiles into ${DOTFILES}...\n"

    env git clone --depth=1 https://jcbmln@gitlab.com/jcbmln/dotfiles.git $DOTFILES || {
        echo "${RED}Error: git clone failed\n"
        exit 1
    }
}

move_files() {
    echo "${YELLOW}Moving files...\n"

    mv ${DOTFILES}/rc/.*rc $HOME/
    mv ${DOTFILES}/.zsh $HOME/
    mv ${DOTFILES}/.nano $HOME/
    mv ${DOTFILES}/bin $HOME/

    echo "${GREEN}Done!"
}

cleanup() {
    echo "${YELLOW}Cleaning up...\n"

    rm -rf ${DOTFILES}
}

get_zsh
get_git
clone_dotfiles
move_files
cleanup
