#!/bin/sh

# =============================
# IMPORTANT VARIABLES
# =============================

# Base directory for code repositories
CODE_DIR="$HOME/code"

# Dotfiles repository directory (must be cloned here beforehand)
DOTFILES_DIR="$CODE_DIR/dotfiles"

# SSH URL for your separate Neovim configuration repository
NVIM_REPO_URL="https://github.com/sunnybharne/nvim.git" 

# Directory where the Neovim repo will be cloned
NVIM_CLONE_DIR="$CODE_DIR/nvim"

# Neovim configuration destination directory
CONFIG_DIR="$HOME/.config"
NVIM_DEST="$CONFIG_DIR/nvim"

# =============================
# FUNCTION DEFINITIONS
# =============================

# Function to install required packages on Arch Linux
install_packages() {
    if [ -f /etc/arch-release ]; then
        echo "Arch Linux detected. Installing git and zsh..."
        sudo pacman -S --noconfirm git zsh lazygit make
    else
        echo "This script is intended for Arch Linux. Exiting..."
        exit 1
    fi
}

# Function to ensure a directory exists; create it if it doesn't
ensure_dir() {
    DIR="$1"
    if [ ! -d "$DIR" ]; then
        echo "Directory $DIR does not exist. Creating it..."
        mkdir -p "$DIR"
    else
        echo "Directory $DIR already exists."
    fi
}

# Function to remove a file or directory if it exists
remove_file() {
    FILE="$1"
    if [ -e "$FILE" ]; then
        echo "$FILE exists. Removing it..."
        rm -rf "$FILE"
        if [ $? -eq 0 ]; then
            echo "Successfully removed $FILE."
        else
            echo "Failed to remove $FILE. Please check permissions."
            exit 1
        fi
    else
        echo "$FILE does not exist."
    fi
}

# Function to create a symlink from source to destination
create_symlink() {
    SRC="$1"
    DEST="$2"
    echo "Creating symlink for $(basename "$DEST")..."
    ln -s "$SRC" "$DEST"
}

# Install yay (AUR helper) if it's not already installed
install_yay() {
    if ! command -v yay > /dev/null 2>&1; then
        echo "yay not found. Installing yay..."
        cd /tmp || exit 1
        git clone https://aur.archlinux.org/yay.git
        cd yay || exit 1
        makepkg -si --noconfirm
        cd - || exit 1
    else
        echo "yay is already installed."
    fi
}

# Install oh-my-posh using yay if it's not already installed
install_ohmyposh() {
    if ! command -v oh-my-posh > /dev/null 2>&1; then
        echo "Installing oh-my-posh via yay..."
        yay -S --noconfirm oh-my-posh-bin
    else
        echo "oh-my-posh is already installed."
    fi
}

# Install Zsh-related packages (syntax highlighting & autosuggestions)
install_zsh_packages() {
    echo "Installing zsh-syntax-highlighting via pacman..."
    sudo pacman -S --noconfirm zsh-syntax-highlighting
    echo "Installing zsh-autosuggestions via yay..."
    yay -S --noconfirm zsh-autosuggestions
}

# =============================
# SCRIPT EXECUTION
# =============================

# Install required packages (git and zsh)
install_packages

# Install yay (AUR helper) if needed
install_yay

# Install oh-my-posh
install_ohmyposh

# Install zsh config
install_zsh_packages

# Ensure the CODE_DIR exists
ensure_dir "$CODE_DIR"

# Remove existing .gitconfig and .zshrc from home directory
remove_file "$HOME/.gitconfig"
remove_file "$HOME/.zshrc"

# Verify that the dotfiles repository exists
if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles repository found at $DOTFILES_DIR."
else
    echo "Dotfiles repository not found at $DOTFILES_DIR. Exiting..."
    exit 1
fi

# Create symlinks for .gitconfig and .zshrc from the dotfiles repository
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Remove any existing Neovim clone (directory or symlink) in the code directory
remove_file "$NVIM_CLONE_DIR"

# Clone the Neovim repository via SSH into the code directory
echo "Cloning Neovim repository from $NVIM_REPO_URL into $NVIM_CLONE_DIR..."
git clone "$NVIM_REPO_URL" "$NVIM_CLONE_DIR" || { echo "Failed to clone Neovim repo. Exiting..."; exit 1; }

# Ensure the .config directory exists
ensure_dir "$CONFIG_DIR"

# Remove any existing Neovim configuration directory in .config and create a new symlink
remove_file "$NVIM_DEST"
create_symlink "$NVIM_CLONE_DIR" "$NVIM_DEST"

echo "Setup complete."
