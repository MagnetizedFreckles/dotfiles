# Cargo PATH
export PATH=$PATH:$HOME/.cargo/bin/

# Vi-mode for bash
set -o vi

# Aliased for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # Lazygit alias for dotfile bare repo

# Setting up starship prompt (should be at the end)
eval "$(starship init bash)"
