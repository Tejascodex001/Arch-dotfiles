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

# Keybindings
bindkey -e                                        # emacs mode (normal terminal behavior)
bindkey '^[[A' history-search-backward            # Up arrow — search history
bindkey '^[[B' history-search-forward             # Down arrow — search history
bindkey '^[[H' beginning-of-line                  # Home key
bindkey '^[[F' end-of-line                        # End key
bindkey '^[[3~' delete-char                       # Delete key
bindkey '^[[1;5C' forward-word                    # Ctrl+Right
bindkey '^[[1;5D' backward-word                   # Ctrl+Left
bindkey '^H' backward-delete-char                 # Backspace
bindkey '^[[Z' reverse-menu-complete              # Shift+Tab

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
    if [ ! -d ".venv" ]; then
        echo "No .venv found. Choose Python version:"
        
        # Find all available python versions
        VERSIONS=()
        for py in python python3 python3.10 python3.11 python3.12 python3.13 python3.14; do
            if command -v $py &>/dev/null; then
                VERSION=$($py --version 2>&1 | awk '{print $2}')
                VERSIONS+=("$py ($VERSION)")
            fi
        done

        # Display options
        for i in "${!VERSIONS[@]}"; do
            echo "  $((i+1)). ${VERSIONS[$i]}"
        done

        echo -n "Select [1-${#VERSIONS[@]}] (default=1): "
        read CHOICE
        CHOICE=${CHOICE:-1}
        
        # Extract python binary
        PYTHON=$(echo ${VERSIONS[$((CHOICE-1))]} | awk '{print $1}')
        
        echo "Creating .venv with $PYTHON..."
        uv venv .venv --python $PYTHON
    fi
    
    source .venv/bin/activate
    echo "Activated $(python --version) in $(pwd)/.venv"
}
export OLLAMA_API_BASE=http://localhost:11434
