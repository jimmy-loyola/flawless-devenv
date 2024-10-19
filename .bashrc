source $HOME/.alias
source $HOME/.funcs
source $HOME/.colors
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;33m\]\w\[\e[0m\] \[\e[38;5;77m\]${PS1_CMD1}\n\[\e[0m\]'
PATH="$HOME/.local/bin:$PATH"
eval "$($HOME/.local/bin/zoxide init bash)"
