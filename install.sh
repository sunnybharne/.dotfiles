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

# Function to install a package
install_package() {
    local package_name=$1
    echo "🔍 Checking for $package_name..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt &>/dev/null; then
            sudo apt update && sudo apt install -y "$package_name"
        elif command -v pacman &>/dev/null; then
            sudo pacman -S --noconfirm "$package_name"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew &>/dev/null; then
            echo "🍺 Homebrew is not installed. Installing..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        brew install "$package_name"
    else
        echo "❌ Unsupported OS. Please install $package_name manually."
    fi
}

# Install Zsh
if ! command -v zsh &>/dev/null; then
    echo "⚠️ Zsh is not installed. Installing..."
    install_package zsh
fi

# Install Neovim
if ! command -v nvim &>/dev/null; then
    echo "⚠️ Neovim is not installed. Installing..."
    install_package neovim
fi

# Install Python
if ! command -v python3 &>/dev/null; then
    echo "⚠️ Python is not installed. Installing..."
    install_package python3
fi

# Install Node.js
if ! command -v node &>/dev/null; then
    echo "⚠️ Node.js is not installed. Installing..."
    install_package node
fi

# Install Java
if ! command -v java &>/dev/null; then
    echo "⚠️ Java is not installed. Installing..."
    install_package openjdk
fi

# Install Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "⚡ Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k Theme
if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then
    echo "🎨 Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# Install Zsh Plugins
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    echo "✨ Installing Zsh Autosuggestions..."
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    echo "🌈 Installing Zsh Syntax Highlighting..."
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

echo "🔗 Creating symlinks..."
ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim

# Reload config
echo "🔄 Reloading Zsh configuration..."
source ~/.zshrc

echo "✅ Dotfiles and development environment setup complete!"

# Switch to Zsh
exec zsh
