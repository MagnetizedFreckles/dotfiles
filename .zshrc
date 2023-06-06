export ZSH="$HOME/.zsh"

# Get all aliases and PATH variables
source "$HOME/.shells_common.sh"


# Histfile settings
export HISTFILE=$ZSH/.zsh_history
# How many commands zsh will load to memory.
export HISTSIZE=10000
# How many commands history will save on file.
export SAVEHIST=10000
# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS
# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS


# Plugins

# git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh/zsh-vi-mode
source $ZSH/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $HOME/.zsh/fast-syntax-highlighting
source $ZSH/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# For theme:
# fast-theme base16

# git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh

# TODO: Maybe, install history-substring-search someday later


# Prompt using starship (should be after exporting PATH to avoid issues)
eval "$(starship init zsh)"
