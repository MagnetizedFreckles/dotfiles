# Setting up starship prompt
eval "$(starship init bash)"

# Alias for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
