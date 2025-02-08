#!/bin/bash

# Define the Git repo
DOTFILES_REPO="https://github.com/sunnybharne/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

echo "📂 Cloning dotfiles repository..."
if [ -d "$DOTFILES_DIR" ]; then
    echo "✅ Dotfiles repo already exists. Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
else
    git clone --depth=1 "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo "🔗 Creating symlinks..."
ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim

echo "✅ Dotfiles setup complete!"
exec zsh  # Reload shell
