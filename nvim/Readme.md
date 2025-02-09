# My Neovim Configuration

This repository contains my personal Neovim configuration files. Below is a detailed explanation of the setup and the plugins used.

## Directory Structure

```
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── colors/
│   └── mytheme.lua
├── iterm/
│   ├── green-retro.itermcolors
│   └── green.itermcolors
├── lua/
│   ├── scratch-buffer.lua
│   ├── plugins/
│   │   ├── citrus.lua
│   │   ├── cokeline.lua
│   │   ├── colorize.lua
│   │   ├── comments.lua
│   │   ├── conform.lua
│   │   ├── copilot-chat.lua
│   │   ├── copilot.lua
│   │   ├── cosmetic.lua
│   │   ├── dashboard.lua
│   │   ├── flash.lua
│   │   ├── grapple.lua
│   │   ├── lazygit.lua
│   │   ├── luasnip.lua
│   │   ├── mason.lua
│   │   ├── neo-tree.lua
│   │   ├── nord.lua
│   │   ├── nvim-cmp.lua
│   │   ├── nvim-lint.lua
│   │   ├── nvim-lspconfig.lua
│   │   ├── nvim-tmux-navigator.lua
│   │   ├── reactcomments.lua
│   │   ├── telescope.lua
│   │   ├── toggelterm.lua
│   │   ├── treesitter.lua
│   │   └── whichkey.lua
│   ├── snippets/
│   │   ├── snippets.sh
│   │   ├── bicep/
│   │   │   ├── bicep.lua
│   │   │   ├── managed-identity-create.bicep
│   │   │   └── management-group-create.bicep
│   │   ├── yaml/
│   │   │   ├── stages.yaml
│   │   │   ├── task-azurecli.yaml
│   │   │   ├── trigger.yaml
│   │   │   └── yaml.lua
├── pack/
│   └── github/
│       └── start/
│           └── copilot.vim/
│               ├── LICENSE.md
│               ├── README.md
│               ├── SECURITY.md
│               ├── autoload/
│               │   ├── copilot.vim
│               │   ├── copilot/
│               │   │   ├── client.vim
│               │   │   ├── handlers.vim
│               │   │   ├── job.vim
│               │   │   ├── logger.vim
│               │   │   ├── panel.vim
│               │   │   └── util.vim
│               │   └── copilot/version.vim
│               ├── dist/
│               │   ├── crypt32.node
│               │   ├── language-server.js
│               │   ├── language-server.js.map
│               │   ├── tree-sitter-go.wasm
│               │   ├── tree-sitter-javascript.wasm
│               │   ├── tree-sitter-python.wasm
│               │   ├── tree-sitter-ruby.wasm
│               │   ├── tree-sitter-tsx.wasm
│               │   ├── tree-sitter-typescript.wasm
│               │   ├── tree-sitter.wasm
│               │   ├── resources/
│               │   │   ├── cl100k_base.tiktoken.noindex
│               │   │   └── o200k_base.tiktoken.noindex
│               │   ├── compiled/
│               │   │   ├── darwin/
│               │   │   │   ├── arm64/
│               │   │   │   │   └── kerberos.node
│               │   │   │   └── x64/
│               │   │   │       └── kerberos.node
│               │   │   ├── linux/
│               │   │   │   ├── arm64/
│               │   │   │   │   └── kerberos.node
│               │   │   │   └── x64/
│               │   │   │       └── kerberos.node
│               │   │   └── win32/
│               │   │       └── x64/
│               │   │           └── kerberos.node
│               ├── doc/
│               │   ├── copilot.txt
│               │   └── tags
│               ├── lua/
│               │   └── _copilot.lua
│               ├── plugin/
│               │   └── copilot.vim
│               ├── syntax/
│               │   ├── copilot.vim
│               │   └── copilotlog.vim
```

## Configuration Files

### `init.lua`
This is the main configuration file for Neovim. It sets up the basic settings and loads the plugins.

### `lazy-lock.json`
This file is used by the lazy.nvim plugin manager to lock the versions of the plugins.

### `colors/mytheme.lua`
This file contains the custom color scheme for Neovim.

### `iterm/`
This directory contains iTerm2 color schemes.

### `lua/scratch-buffer.lua`
A scratch buffer for testing and experimenting with Lua code.

## Plugins

### `plugins/citrus.lua`
Configuration for the Citrus plugin, which provides a collection of useful functions and utilities for Neovim.

### `plugins/cokeline.lua`
Configuration for the Cokeline plugin, which enhances the buffer line with additional features and customization options.

### `plugins/colorize.lua`
Configuration for the Colorize plugin, which adds color highlighting for various elements in the code.

### `plugins/comments.lua`
Configuration for the Comments plugin, which provides easy commenting and uncommenting of code blocks.

### `plugins/conform.lua`
Configuration for the Conform plugin, which ensures consistent code formatting across different files and projects.

### `plugins/copilot-chat.lua`
Configuration for the Copilot Chat plugin, which integrates GitHub Copilot's chat functionality into Neovim.

### `plugins/copilot.lua`
Configuration for the GitHub Copilot plugin, which provides AI-powered code suggestions and completions.

### `plugins/cosmetic.lua`
Configuration for cosmetic enhancements, such as improved UI elements and visual tweaks.

### `plugins/dashboard.lua`
Configuration for the Dashboard plugin, which provides a customizable start screen for Neovim.

### `plugins/flash.lua`
Configuration for the Flash plugin, which adds visual effects and animations to Neovim.

### `plugins/grapple.lua`
Configuration for the Grapple plugin, which provides advanced text manipulation and navigation features.

### `plugins/lazygit.lua`
Configuration for the Lazygit plugin, which integrates the Lazygit terminal UI for Git into Neovim.

### `plugins/luasnip.lua`
Configuration for the LuaSnip plugin, which provides a powerful snippet engine for Neovim.

### `plugins/mason.lua`
Configuration for the Mason plugin, which manages external tools and dependencies for Neovim.

### `plugins/neo-tree.lua`
Configuration for the Neo-tree plugin, which provides a file explorer tree for Neovim.

### `plugins/nord.lua`
Configuration for the Nord color scheme plugin, which provides a beautiful and consistent color scheme for Neovim.

### `plugins/nvim-cmp.lua`
Configuration for the nvim-cmp completion plugin, which provides powerful and customizable code completion features.

### `plugins/nvim-lint.lua`
Configuration for the nvim-lint plugin, which provides linting support for various programming languages.

### `plugins/nvim-lspconfig.lua`
Configuration for the nvim-lspconfig plugin, which provides easy setup and configuration for Neovim's built-in LSP client.

### `plugins/nvim-tmux-navigator.lua`
Configuration for the nvim-tmux-navigator plugin, which provides seamless navigation between Neovim and tmux panes.

### `plugins/reactcomments.lua`
Configuration for the React Comments plugin, which provides enhanced commenting features for React code.

### `plugins/telescope.lua`
Configuration for the Telescope plugin, which provides a powerful and extensible fuzzy finder for Neovim.

### `plugins/toggelterm.lua`
Configuration for the ToggleTerm plugin, which provides an easy way to toggle terminal windows in Neovim.

### `plugins/treesitter.lua`
Configuration for the Treesitter plugin, which provides advanced syntax highlighting and code parsing features.

### `plugins/whichkey.lua`
Configuration for the WhichKey plugin, which provides a popup menu for displaying available keybindings in Neovim.

## Snippets

### `snippets/snippets.sh`
Shell script snippets.

### `snippets/bicep/`
Bicep snippets for Azure Resource Manager templates.

### `snippets/yaml/`
YAML snippets for various configurations.

## Copilot Plugin

### `pack/github/start/copilot.vim/`
This directory contains the GitHub Copilot plugin files.

## License

This configuration is licensed under the MIT License. See the `LICENSE.md` file for more details.
