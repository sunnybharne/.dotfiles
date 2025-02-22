# Dotfiles Setup

## Overview
This project automates the setup of development environment configurations using a dotfiles repository. The script creates symbolic links for configuration files, installs necessary dependencies via Homebrew, and ensures smooth integration with **Zsh, Tmux, Neovim, and iTerm2**.

## Features
- Symlinks dotfiles to the home directory
- Installs required CLI tools and dependencies using Homebrew
- Sets up Neovim configuration
- Ensures a clean and reproducible development environment
- Automatically installs Tmux Plugin Manager (TPM)
- Supports automatic sourcing of `.zshrc`
- **Syncs iTerm2 preferences for consistent terminal settings**

## Installation

## Use this on fresh arch linux
```bash
curl -fsSL https://raw.githubusercontent.com/sunnybharne/.dotfiles/main/install.sh | bash
```
### Clone the Repository if you want the entire dotfiles
```sh
git clone https://github.com/sunnybharne/dotfiles.git ~/.dotfiles
```

### Prerequisites
Ensure that you have the following installed before running the script:
- **Git** (for cloning dotfiles)
- **Homebrew** (for package management)
- **Zsh** (default shell, recommended for best experience)
- **iTerm2** (optional, but recommended for best terminal experience)

## Homebrew Dependencies
The script installs various CLI tools and development utilities using a `Brewfile`. If Homebrew is installed, dependencies will be installed automatically.

To manually install dependencies:
```sh
brew bundle --file=~/Brewfile
```

## Repository Structure
```
.dotfiles/
│── Brewfile                 # Homebrew package list
│── install.sh               # Installation script
│── zsh/
│   ├── .zshrc               # Zsh configuration
│── nvim/
│   ├── init.lua             # Neovim configuration
│── tmux/
│   ├── .tmux.conf           # Tmux configuration
│── iterm/
│   ├── com.googlecode.iterm2.plist  # iTerm2 preferences
```

## Configuration Details
### **Zsh Configuration**
- Symlinks `.zshrc` from the dotfiles repository
- Ensures `zsh-autosuggestions` and `zsh-syntax-highlighting` are installed

### **Neovim Configuration**
- Links Neovim configuration to `~/.config/nvim`
- Ensures Neovim is installed via Homebrew

### **Tmux Configuration**
- Links `.tmux.conf`
- Installs TPM (Tmux Plugin Manager) if not present
- Reloads Tmux configuration if Tmux is running

### **iTerm2 Configuration**
- Stores iTerm2 preferences in `~/.dotfiles/iterm/com.googlecode.iterm2.plist`
- Automatically symlinks the preferences to `~/Library/Preferences/`
- Ensures consistent terminal settings across machines

## Troubleshooting
### **Homebrew is not installed**
If Homebrew is missing, install it using:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# curl -fsSL https://raw.githubusercontent.com/sunnybharne/.dotfiles/main/install.sh | bash
```

### **Zsh is not the default shell**
Run the following to switch to Zsh:
```sh
chsh -s $(which zsh)
```

### **Tmux not reloading configuration**
Ensure Tmux is running and reload manually:
```sh
tmux source-file ~/.tmux.conf
```

### **iTerm2 preferences are not applied**
If iTerm2 doesn't load your settings:
1. Open **iTerm2** → `Preferences` (`Cmd + ,`)
2. Go to **General** → Check ✅ `Load preferences from a custom folder`
3. Set the path to:
   ```
   ~/.dotfiles/iterm
   ```
4. Restart iTerm2.

## Contributing
Feel free to fork the repository and submit pull requests for improvements.

## License
This project is open-source and available under the MIT License.

---
For any issues, feel free to reach out or open an issue in the repository. 🚀
