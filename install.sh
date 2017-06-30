#!/bin/sh

# https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh

# Get all dotfiles and any missing tools need for a complete environment.

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
NORMAL="$(tput sgr0)"

DOTFILES="${HOME}/.dotfiles"

clone_dotfiles() {
    echo "${YELLOW}Cloning dotfiles into ${DOTFILES}...\n"

    git clone --depth=1 https://jcbmln@gitlab.com/jcbmln/dotfiles.git $DOTFILES
}

move_files() {
    echo "${YELLOW}Moving files...\n"

    rsync -av ${DOTFILES}/.oh-my-zsh $HOME/

    mv ${DOTFILES}/rc/.*rc $HOME/
    mv ${DOTFILES}/.nano $HOME/
    mv ${DOTFILES}/bin $HOME/

    echo "${GREEN}Done!"
}

cleanup() {
    echo "${YELLOW}Cleaning up...\n"

    rm -rf ${DOTFILES}

    echo "${GREEN}Done!\n${NORMAL}"
}

clone_dotfiles
move_files
cleanup