# A file for aliases that should work across bash, zsh and fish
alias myip='curl https://myip.wtf/json'
alias myipproxy='curl --socks5 127.0.0.1:2080 https://myip.wtf/json'

# Alias for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # Lazygit alias
