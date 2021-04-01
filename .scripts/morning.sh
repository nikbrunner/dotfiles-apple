#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
# printf "I ${RED}love${NC} Stack Overflow\n"

echo "${GREEN}Good Morning Nik!${NC}"

# Update Homebrew
echo "${ORANGE}::: Updating Homebrew...${NC}"
brew update
brew upgrade

# Update dotfiles
echo "${ORANGE}::: Pushing current state of dotfiles-apple...${NC}"
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
df commit -a -m \"Updates\" && df push

# Update vim config
echo "${ORANGE}::: Pushing current state of neovim config...${NC}"
NVIM_PATH="$HOME/.config/nvim"
git -C $NVIM_PATH commit -a -m \"Updates\" && git -C $NVIM_PATH push

#  Update stoic theme
echo "${ORANGE}::: Updating Obsidian Stoic Theme${NC}"
sh $HOME/.scripts/updateStoicTheme.sh

