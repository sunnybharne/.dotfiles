#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

echo "🔗 Creating symlinks for dotfiles..."

# Ensure no existing .zshrc file blocks the symlink
if [ -f "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
    rm -f "$HOME/.zshrc"
    echo "🗑️ Removed existing .zshrc"
fi

# Symlink .zshrc
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo "✅ Linked .zshrc"

# Ensure Neovim config directory exists
mkdir -p "$HOME/.config"

# Symlink Neovim config
if [ -d "$HOME/.config/nvim" ] || [ -L "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
    echo "🗑️ Removed existing Neovim config"
fi
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "✅ Linked Neovim config"

# Symlink Brewfile
ln -sf "$DOTFILES_DIR/Brewfile" "$HOME/Brewfile"
echo "✅ Linked Brewfile"

# Symlink tmux configuration
if [ -f "$HOME/.tmux.conf" ] || [ -L "$HOME/.tmux.conf" ]; then
    rm -f "$HOME/.tmux.conf"
    echo "🗑️ Removed existing .tmux.conf"
fi
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "✅ Linked .tmux.conf"

# Check if Homebrew is installed
if command -v brew &>/dev/null; then
    echo "🍺 Homebrew found! Installing dependencies from Brewfile..."
    brew bundle --file="$HOME/Brewfile"
    echo "✅ Homebrew dependencies installed."
else
    echo "⚠️ Homebrew not found! Skipping Brewfile installation."
fi

# Install TPM (Tmux Plugin Manager) if not installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "📦 Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "✅ TPM installed."
fi

# Reload tmux configuration if tmux is running
if pgrep tmux > /dev/null; then
    tmux source-file ~/.tmux.conf
    echo "🔄 Reloaded .tmux.conf"
fi

echo "🚀 Dotfiles setup complete!"
