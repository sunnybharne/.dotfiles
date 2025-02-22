#!/bin/bash

# Create code dir
mkdir -p ~/code && cd ~/code

# Remove the dotfiles repo
rm -rf dotfiles

# Clone the dotfiles repo
git clone https://github.com/sunnybharne/dotfiles.git

# Remove .files from home
rm -rf ~/.gitconfig

# create links to the dot files
ln -s .gitconfig ~/.gitconfig

