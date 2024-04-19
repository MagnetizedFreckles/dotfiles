# Aliases
alias la="ls -lah"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias scim="sc-im"
alias syu="paru -Syu"

# Editing crontab with neovim
alias crontab="export VISUAL=nvim; crontab"

alias vimdiff="nvim -d"
export EDITOR=nvim

# Enable mouse support in less (and also man)
# Without --RAW-CONTROL-CHARS stuff breaks like pkgbuilds in yay and paru
export LESS='--mouse --wheel-lines=3 --RAW-CONTROL-CHARS'

# Set gpg up so I don't have to type passphrase every time
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# Alias for managing dotfiles using bare gitrepo
alias dfgit='/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # Lazygit alias for dotfile bare repo

# Shell wrapper for launching yazi file manager with the ability to change cwd
# Copied from here: https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Just a glorified alias.
# Probably will make it so it can accept more arguments
function rsynclocal() {
	rsync -avhcWP --no-compress --delete-after "$1" "$2"
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
