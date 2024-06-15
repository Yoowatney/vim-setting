#!/bin/bash

# Iterm2
brew install --cask iterm2

# Chrome
brew install --cask google-chrome

# Slack
brew install --cask slack

# Discord
brew install --cask discord


# Postman
brew install --cask postman

# Docker
brew install --cask docker

# Notion
brew install --cask notion

# BTT
brew install --cask bettertouchtool

# wireshark
brew install --cask bettertouchtool

# neovim
brew install neovim

# lazygit
brew install lazygit

# tmux
brew install tmux

# asdf
brew install asdf
# Install asdf
echo -e "\n. \"$(brew --prefix asdf)/libexec/asdf.sh\"" >> ~/.zshrc

# zoxide
brew install zoxide


brew tap hashicorp/tap
brew install hashicorp/tap/terraform
terraform -install-autocomplete
brew install hashicorp/tap/terraform-ls
