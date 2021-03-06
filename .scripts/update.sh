#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Good Morning Nik!${NC}"

function homeDirGit () {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $1
} 

# Update vim config
function updateVimDotfiles () {
    echo -e "${ORANGE}::: Updating NeoVim dotfiles...${NC}"
    NVIM_PATH="$HOME/.config/nvim"
    git -C $NVIM_PATH add .
    git -C $NVIM_PATH commit -a -m \"Updates\" && git -C $NVIM_PATH push
}

# Update dotfiles
function updateDotfiles () {
    echo -e "${ORANGE}::: Updating Home-Directory dotfiles...${NC}"
    # Update configured submodules 
    # TODO This is a problem currently, since this always puts my submodule on a detached HEAD state
    # homeDirGit "submodule update"
    homeDirGit "commit -a -m \"Updates\""
    homeDirGit "push"
}

# Update stoic theme
function updateStoicTheme () {
    echo -e "${ORANGE}::: Updating Obsidian Stoic Theme${NC}"
    sh $HOME/.scripts/updateStoicTheme.sh
}

# Update Homebrew
function updateHomebrew () {
    echo -e "${ORANGE}::: Updating Homebrew...${NC}"
    brew update
    brew outdated
}

function updateFull () {
    updateVimDotfiles
    updateDotfiles
    updateStoicTheme
    updateHomebrew
}

case $1 in
    "--dotfiles")
        updateVimDotfiles
        updateDotfiles
    ;;

    "--stoic")
        updateStoicTheme
    ;;

    "--brew")
        updateHomebrew
    ;;

    "--full")
        updateFull
    ;;

    *)
        echo "Unknown argument \"$1\""
    ;;
esac

