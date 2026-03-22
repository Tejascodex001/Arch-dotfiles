# Path
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim

# CUDA
export PATH="/opt/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS SHARE_HISTORY

# Completion
autoload -Uz compinit && compinit

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
PS1='%F{cyan}%~%f %# '

# Aliases
alias v='nvim'
alias ll='ls -lah --color=auto'
alias gs='git status'
alias y='yazi'
alias cheat='nvim ~/dotfiles/docs/cheatsheet.md'
alias sync='~/dotfiles/sync.sh'

# Activate venv in current directory
activate() {
    source .venv/bin/activate
}
