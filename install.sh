#!/bin/sh

# Check if the 'code' directory exists, and create it if it doesn't
CODE_DIR="$HOME/code"
if [ ! -d "$CODE_DIR" ]; then
    echo "Directory $CODE_DIR does not exist. Creating it..."
    mkdir -p "$CODE_DIR"
else
    echo "Directory $CODE_DIR already exists."
fi

# Check if the .gitconfig symlink exists, and remove it if it does
GITCONFIG_SYMLINK="$HOME/.gitconfig"
if [ -L "$GITCONFIG_SYMLINK" ]; then
    echo "Symlink $GITCONFIG_SYMLINK exists. Removing it..."
    rm "$GITCONFIG_SYMLINK"
else
    echo "Symlink $GITCONFIG_SYMLINK does not exist."
fi

# Check if the .zshrc symlink exists, and remove it if it does
ZSHRC_SYMLINK="$HOME/.zshrc"
if [ -L "$ZSHRC_SYMLINK" ]; then
    echo "Symlink $ZSHRC_SYMLINK exists. Removing it..."
    rm "$ZSHRC_SYMLINK"
else
    echo "Symlink $ZSHRC_SYMLINK does not exist."
fi

