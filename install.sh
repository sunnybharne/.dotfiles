#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

echo "🔗 Creating symlinks for dotfiles..."

# Symlink .zshrc
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo "✅ Linked .zshrc"

# Symlink Neovim config
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "✅ Linked Neovim config"

# Symlink Brewfile
ln -sf "$DOTFILES_DIR/Brewfile" "$HOME/Brewfile"
echo "✅ Linked Brewfile"

# Check if Homebrew is installed
if command -v brew &>/dev/null; then
    echo "🍺 Homebrew found! Installing dependencies from Brewfile..."
    brew bundle --file="$HOME/Brewfile"
    echo "✅ Homebrew dependencies installed."
else
    echo "⚠️ Homebrew not found! Skipping Brewfile installation."
fi

echo "🚀 Dotfiles setup complete!"
