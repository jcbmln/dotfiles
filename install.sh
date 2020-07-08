#!/bin/sh

# https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh

# Get all dotfiles and any missing tools need for a complete environment.

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
NORMAL="$(tput sgr0)"
DOTFILES="${HOME}/.dotfiles"
NEEDED_PACKAGES="zsh git"

check_packages() {
    echo "${BLUE}Checking for the packages: ${NEEDED_PACKAGES}\n${NORMAL}"
    if ! [ -x "$(command -v zsh)" ] || ! [ -x "$(command -v git)" ]; then
        install_packages
    fi
}

install_packages() {
    echo "${BLUE}Installing packages: ${NEEDED_PACKAGES}\n${NORMAL}"
    if [ -x "$(command -v apt)" ]; then 
        sudo apt update && sudo apt upgrade && sudo apt insall $NEEDED_PACKAGES
    elif [ -x "$(command -v yum)" ]; then 
        sudo yum update && sudo yum install $NEEDED_PACKAGES
    elif [ -x "$(command -v zypper)" ]; then 
        sudo zypper ref && sudo zypper update && sudo zypper install $NEEDED_PACKAGES
    elif [ -x "$(command -v pacman)" ]; then 
        sudo pacman -Syu && sudo pacman -S $NEEDED_PACKAGES
    else 
        echo "${RED}FAILED TO INSTALL PACKAGES: No supported package manager found. Install the following and try again: ${BLUE}${NEEDED_PACKAGES}\n\n${NORMAL}"
        exit 1
    fi
    echo "${GREEN}Done!\n${NORMAL}"
}

clone_dotfiles() {
    echo "${BLUE}Cloning dotfiles into ${DOTFILES}...\n${NORMAL}"

    git clone --depth=1 https://github.com/jcbmln/dotfiles.git $DOTFILES
}

move_files() {
    echo "${BLUE}Moving files...\n${NORMAL}"

    mv ${DOTFILES}/.*rc $HOME/
    
    rsync -av ${DOTFILES}/.nano $HOME/
    rsync -av ${DOTFILES}/.zsh $HOME/
    rsync -av ${DOTFILES}/bin $HOME/

    echo "${GREEN}Done!${NORMAL}"
}

cleanup() {
    echo "${BLUE}Cleaning up...\n${NORMAL}"

    rm -rf ${DOTFILES}

    echo "${GREEN}Done!\n${NORMAL}"
}

check_packages
clone_dotfiles
move_files
cleanup
