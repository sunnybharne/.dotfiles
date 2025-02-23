#!/bin/sh

# =============================
# IMPORTANT VARIABLES 
# =============================

# Directories
CODE_DIR="$HOME/code"
DOTFILES_DIR="$CODE_DIR/dotfiles"

CONFIG_DIR="$HOME/.config"
NVIM_DEST="$CONFIG_DIR/nvim"

# repositories
NVIM_REPO_URL="https://github.com/sunnybharne/nvim.git" 
NVIM_CLONE_DIR="$CODE_DIR/nvim"

DWM_REPO_URL="https://github.com/sunnybharne/dwm.git"
DWM_CLONE_DIR="$CODE_DIR/dwm"

ST_REPO_URL="https://github.com/sunnybharne/st.git"
ST_CLONE_DIR="$CODE_DIR/st"

DMENU_REPO_URL="https://github.com/sunnybharne/dmenu.git"
DMENU_CLONE_DIR="$CODE_DIR/dmenu"

DWMBLOCKS_REPO_URL="https://github.com/sunnybharne/dwm-blocks.git"
DWMBLOCKS_CLONE_DIR="$CODE_DIR/dwmblocks"

# =============================
# FUNCTION DEFINITIONS
# =============================

# Function to install required packages on Arch Linux
install_packages() {
    if [ -f /etc/arch-release ]; then
        echo "Arch Linux detected. Installing git and zsh..."
        sudo pacman -Syu
        sudo pacman -S --noconfirm git
        sudo pacman -S --noconfirm zsh
        sudo pacman -S --noconfirm lazygit
        sudo pacman -S --noconfirm make
        sudo pacman -S --noconfirm oh-my-zsh
        sudo pacman -S --noconfirm tmux
        sudo pacman -S --noconfirm xorg-xrdb
        sudo pacman -S --noconfirm fzf
        sudo pacman -S --noconfirm ttf-nerd-fonts-symbols
        sudo pacman -S --noconfirm zsh-syntax-highlighting
    else
        echo "This script is intended for Arch Linux. Exiting..."
        exit 1
    fi
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

# Install yay packages
install_yay_packages() {
    echo "Installing yay packages..."
    yay -S --noconfirm zsh-autosuggestions
    yay -S --noconfirm ttf-meslo-nerd-font
    yay -S --noconfirm nerd-fonts-fira-code
    yay -S --noconfirm ttf-ubuntu-mono-nerd
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

# Install oh my zsh
configure_oh_my_zsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh-My-Zsh is already installed."
    else
        echo "Installing Oh-My-Zsh using the official script..."
        RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    # Ensure .zshrc sources the correct path
    if ! grep -q "source /usr/share/oh-my-zsh/oh-my-zsh.sh" "$HOME/.zshrc"; then
        echo "Updating .zshrc to correctly source oh-my-zsh..."
        sed -i 's|source $HOME/.oh-my-zsh/oh-my-zsh.sh|source /usr/share/oh-my-zsh/oh-my-zsh.sh|' "$HOME/.zshrc"
    fi
}

# Clone and build a suckless repository
clone_and_build() {
    REPO_URL="$1"
    DEST_DIR="$2"
    
    # Remove existing directory if it exists
    remove_file "$DEST_DIR"

    # Clone the repository
    echo "Cloning $REPO_URL into $DEST_DIR..."
    git clone "$REPO_URL" "$DEST_DIR" || { echo "Failed to clone $REPO_URL. Exiting..."; exit 1; }

    # Compile and install
    echo "Building and installing $(basename "$DEST_DIR")..."
    cd "$DEST_DIR" || exit 1
    sudo make clean install
}

# =============================
# SCRIPT EXECUTION
# =============================

# Install required packages (git and zsh)
install_packages

# Install yay (AUR helper) if needed
install_yay

# Install yay packages
install_yay_packages

# Install oh my zsh
configure_oh_my_zsh

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
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

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

# -----------------------------
# Suckless Programs Installation
# -----------------------------

clone_and_build "$DWM_REPO_URL" "$DWM_CLONE_DIR"
clone_and_build "$ST_REPO_URL" "$ST_CLONE_DIR"
clone_and_build "$DMENU_REPO_URL" "$DMENU_CLONE_DIR"
clone_and_build "$DWMBLOCKS_REPO_URL" "$DWMBLOCKS_CLONE_DIR"

echo "Setup complete. Restart your terminal or run 'exec zsh' to apply changes."
exec zsh
