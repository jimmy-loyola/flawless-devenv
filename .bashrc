# Custom PS1
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\u@\H \[\e[38;5;39m\]\w\[\e[0m\] \[\e[92m\]${PS1_CMD1}\n\[\e[0m\]'

# Add local applications to the PATH
PATH="$HOME/.local/bin:$PATH"

# Load unversioned bash scripts
if [ -f .ext ]; then source .ext; fi

# Init zoxide
eval "$($HOME/.local/bin/zoxide init bash)"

# Load support files
source $HOME/.alias
source $HOME/.funcs
source $HOME/.colors

