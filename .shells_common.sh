# Aliases
alias la="ls -lah"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias scim="sc-im"
alias yay="paru"
alias syu="paru -Syu"
alias vpn="wg-quick up $HOME/.wireguard/*ams.conf"
alias vpndown="wg-quick down $HOME/.wireguard/*ams.conf"


# Editing crontab with neovim
alias crontab="export VISUAL=nvim; crontab"

alias vimdiff="nvim -d"
export EDITOR=nvim

# Alias for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # Lazygit alias for dotfile bare repo


# Export PATH
export PATH=$PATH:$HOME/.cargo/bin/ # Cargo packages
export PATH=$PATH:$HOME/.local/bin/
