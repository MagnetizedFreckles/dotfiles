# Setting up starship prompt
eval "$(starship init bash)"

# Cargo PATH
export PATH=$PATH:/home/marenleka/.cargo/bin/

# Alias for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
