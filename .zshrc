# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Use the Robby Russell Theme
ZSH_THEME="robbyrussell"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-interactive-cd
  fzf
  docker
  tmux
  terraform
  node
)

# Ensure zsh-syntax-highlighting is sourced before setting styles
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestions and syntax highlighting (improved visibility)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ffffff,bold'
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# Declare associative array for syntax highlighting styles
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=white,bold'

# Optimize Zsh startup speed
autoload -U compinit && compinit

# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Aliases for productivity
alias ll='ls -lah --color=auto'
alias vi='nvim'
alias vim='nvim'
alias reload='source ~/.zshrc'
alias t='tmux attach || tmux new -s main'
alias gco='git checkout'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -m'

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Homebrew & fzf setup
export PATH="/opt/homebrew/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix PATH duplication issue
export PATH="$(echo $PATH | awk -v RS=: -v ORS=: '!seen[$0]++')"

# -----------------------------
# Oh My Posh Prompt Configuration
# -----------------------------
if command -v oh-my-posh > /dev/null 2>&1; then
    # Replace 'your-theme.omp.json' with your actual theme file path
    eval "$(oh-my-posh init zsh --config $HOME/.poshthemes/your-theme.omp.json)"
else
    echo "oh-my-posh is not installed."
fi

# Default editor
export EDITOR=nvim
export VISUAL=nvim

# Tmux auto-start
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach || tmux new -s main
fi
