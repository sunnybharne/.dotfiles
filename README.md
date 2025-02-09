# .dotfiles

My dotfiles

## Installation

To install the dotfiles, follow the instructions below:

1. Clone the repository:
    ```sh
    git clone https://github.com/sunnybharne/dotfiles.git ~/.dotfiles
    ```

2. Navigate to the directory:
    ```sh
    cd ~/.dotfiles
    ```

3. Run the installation script:
    ```sh
    ./install.sh
    ```

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

You can also set up the configuration using the following command:

```sh
curl -H 'Cache-Control: no-cache' -sSL "https://raw.githubusercontent.com/yourusername/dotfiles/main/install.sh" | bash
```

## Plugins

This repository includes various plugins for Neovim. The plugins are managed using a plugin manager. Make sure to install the plugin manager and follow its instructions to install the plugins listed in the `nvim/lua/plugins` directory.

## License

This repository is licensed under the MIT License. See the `LICENSE` file for more information.
