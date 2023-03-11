# Cargo PATH
export PATH=$PATH:$HOME/.cargo/bin/

# Alias for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Setting up starship prompt (should be at the end)
eval "$(starship init bash)"
