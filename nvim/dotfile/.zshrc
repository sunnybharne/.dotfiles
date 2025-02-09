# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugin
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ffffff'

source $ZSH/oh-my-zsh.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
