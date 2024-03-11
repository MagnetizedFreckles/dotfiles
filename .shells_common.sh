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

# Editing crontab with neovim
alias crontab="export VISUAL=nvim; crontab"

alias vimdiff="nvim -d"
export EDITOR=nvim

# Enable mouse support in less (and also man)
export LESS='--mouse --wheel-lines=3'

# Alias for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # Lazygit alias for dotfile bare repo

# Shell wrapper for launching yazi file manager with the ability to change cwd
# Copied from here: https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# For correct cursors in wezterm
export XCURSOR_THEME=Breeze_Light wezterm
export XCURSOR_SIZE=30 wezterm

# Export PATH
export PATH=$PATH:$HOME/.cargo/bin/ # Cargo packages
export PATH=$PATH:$HOME/.local/bin/
if ! [ -e /etc/NIXOS ]; then
	export PATH=$PATH:$HOME/.nix-profile/bin/
fi
