# nibru's Mac Install Script

# TODO
# - [ ] Dotfiles Setup
# - [ ] Install Script for Dotfiles
# - [ ] Install Script for Dotfiles

# - SSH Setup -
# Generate a new ssh-keypair
ssh-keygen -t ed25519 -C "nibru@mbp"

# Add public key to clipboard and add it to GitHub
pbcopy < ~/.ssh/id_ed25519.pub

# Test the connection
ssh -T git@github.com

# - Homebrew -
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# - General Apps -
brew install --cask 1password
brew install --cask karabiner-elements
brew install --cask firefox
brew install --cask google-chrome
brew install --cask obsidian
brew install --cask spotify
brew install --cask amethyst
brew install --cask alfred

# Messenger and their dependencies
brew install --cask slack
brew install --cask skype
brew install --cask telegram
brew install --cask signal
brew install --cask camo-studio

# Dev Apps
brew install --cask visual-studio-code
brew install --cask webstorm
brew install --cask iterm2
brew install --cask insomnia
brew install --cask docker

# Design Apps
brew install --cask adobe-creative-cloud
brew install --cask hype
brew install --cask sketch

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install from App Store
# - Hotkey
# - Yoink
# - Pasta

# Install from Website
# - Oh-my-zsh
# - pcloud