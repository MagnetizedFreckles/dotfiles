# Aliases for managing my dotfile bare repo
alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # Lazygit alias

# Abbreviations for shortening frequently used commands
abbr yay paru # Why not?
# abbr syu paru -Syu
abbr vpn wg-quick up $HOME/.wireguard/*-ams.conf
abbr vpndown wg-quick down $HOME/.wireguard/*-ams.conf
abbr scim sc-im
