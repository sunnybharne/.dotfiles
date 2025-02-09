# My Configuration Files

This repository contains my personal configuration files for various tools and applications. These configurations are tailored to enhance my development workflow and productivity.

## Contents

- [Neovim](#neovim)
- [Tmux](#tmux)
- [Zsh](#zsh)
- [Git](#git)
- [Other Tools](#other-tools)

## Neovim

This directory contains my Neovim configuration files.

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/sunnybharne/dotfiles.git ~/.dotfiles
    ```

2. Navigate to the Neovim configuration directory:
    ```sh
    cd ~/.dotfiles/nvim
    ```

3. Create a symbolic link to the Neovim configuration:
    ```sh
    ln -s ~/.dotfiles/nvim ~/.config/nvim
    ```

### Plugins

Here is a list of plugins included in this configuration:
- actions-snippet.lua
- alpha.lua
- auto-pair.lua
- citrus.lua
- cokeline.lua
- colorize.lua
- comments.lua
- conform.lua
- copilot-chat.lua
- copilot.lua
- cosmetic.lua
- dashboard.lua
- flash.lua
- gitsigns.lua
- grapple.lua
- indent.lua
- lazygit.lua
- luasnip.lua
- mason.lua
- neo-tree.lua
- nvim-cmp.lua
- nvim-lint.lua
- nvim-lspconfig.lua
- nvim-tmux-navigator.lua
- tabline.lua
- telescope.lua
- todo.lua
- toggelterm.lua
- tokyo.lua
- treesitter.lua
- whichkey.lua

## Tmux

This directory contains my Tmux configuration files.

### Installation

1. Create a symbolic link to the Tmux configuration:
    ```sh
    ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
    ```

## Zsh

This directory contains my Zsh configuration files.

### Installation

1. Create a symbolic link to the Zsh configuration:
    ```sh
    ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
    ```

## Git

This directory contains my Git configuration files.

### Installation

1. Create a symbolic link to the Git configuration:
    ```sh
    ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
    ```

## Other Tools

This directory contains configuration files for other tools and applications.

### Installation

1. Create symbolic links to the respective configuration files as needed.

## Usage

After setting up the symbolic links, you can start using the configurations by opening the respective applications.

## Contributing

Feel free to fork this repository and make your own changes. Pull requests are welcome.

## License

This project is licensed under the MIT License.
