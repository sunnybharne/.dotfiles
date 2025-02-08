# .dotfiles
My dotfiles

## Installation
To install the dotfiles, follow the instructions below:

## Neovim Configuration
The Neovim configuration files are located in the `nvim` directory. To set up Neovim with these configurations, follow the instructions below:

1. Install Neovim.
2. Copy the contents of the `nvim` directory to your Neovim configuration directory (usually `~/.config/nvim`).

## Zsh Configuration
The Zsh configuration file is located at `zshrc`. To use this configuration, copy the file to your home directory:

```sh
cp zshrc ~/.zshrc
```

## Setup command
```sh
curl -H 'Cache-Control: no-cache' -sSL "https://raw.githubusercontent.com/sunnybharne/.dotfiles/main/mac-setup/install.sh" | bash
```

## iTerm2 Color Schemes
The iTerm2 color schemes are located in the `nvim/iterm` directory. To import a color scheme, follow these steps:

1. Open iTerm2.
2. Go to Preferences > Profiles > Colors > Color Presets > Import.
3. Select the desired `.itermcolors` file from the `nvim/iterm` directory.

## Plugins
This repository includes various plugins for Neovim. The plugins are managed using a plugin manager. Make sure to install the plugin manager and follow its instructions to install the plugins listed in the `nvim/lua/plugins` directory.

## License
This repository is licensed under the MIT License. See the `LICENSE` file for more information.
