#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

echo "Creating symlinks for dotfiles..."

# Ensure no existing .zshrc file blocks the symlink
if [ -f "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
    rm -f "$HOME/.zshrc"
    echo "Removed existing .zshrc"
fi

# Symlink .zshrc
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo "Linked .zshrc"

# Ensure Neovim config directory exists
mkdir -p "$HOME/.config"

# Symlink Neovim config
if [ -d "$HOME/.config/nvim" ] || [ -L "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
    echo "Removed existing Neovim config"
fi
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "Linked Neovim config"

# Symlink Brewfile
ln -sf "$DOTFILES_DIR/Brewfile" "$HOME/Brewfile"
echo "Linked Brewfile"

# Symlink tmux configuration
if [ -f "$HOME/.tmux.conf" ] || [ -L "$HOME/.tmux.conf" ]; then
    rm -f "$HOME/.tmux.conf"
    echo "Removed existing .tmux.conf"
fi
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "Linked .tmux.conf"

# Symlink iTerm2 Preferences
if [ -d "$DOTFILES_DIR/iterm" ]; then
    ln -sf "$DOTFILES_DIR/iterm/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
    echo "Linked iTerm2 preferences"
fi

# Check if Homebrew is installed
if command -v brew &>/dev/null; then
    echo "Homebrew found. Installing dependencies from Brewfile..."
    
    # Handle Homebrew installation failures
    if ! brew bundle --file="$HOME/Brewfile"; then
        echo "Homebrew Bundle failed. Skipping problematic formulas."
    fi
    
    echo "Homebrew dependencies installed."
else
    echo "Homebrew not found. Skipping Brewfile installation."
fi

# Install TPM (Tmux Plugin Manager) if not installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "TPM installed."
fi

# Reload tmux configuration if tmux is running
if pgrep tmux > /dev/null; then
    tmux source-file ~/.tmux.conf
    echo "Reloaded .tmux.conf"
fi

# Check if the current shell is Zsh
if [ "$SHELL" != "/bin/zsh" ]; then
    echo "You are using Bash. To apply all settings, switch to Zsh: run 'zsh' or 'chsh -s $(which zsh)'"
else
    echo "Sourcing .zshrc in Zsh..."
    zsh -c "source $HOME/.zshrc"
    echo ".zshrc reloaded in Zsh."
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Oh My Zsh installed."
fi

echo "Dotfiles setup complete."
