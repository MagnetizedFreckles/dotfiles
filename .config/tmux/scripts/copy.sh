#!/usr/bin/env bash

# A script to copy from tmux buffer

OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
	# Works in my case, but here is another way of checking, may be useful:
	# https://unix.stackexchange.com/questions/202891/how-to-know-whether-wayland-or-x11-is-being-used
	if [ "$XDG_SESSION_TYPE" = "x11" ]; then
		xsel -ip && xsel -op | xsel -ib
		tmux display-message "Copied!"
	elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
		wl-copy
		tmux display-message "Copied!"
	fi
elif [ "$OS" = "Darwin" ]; then
	reattach-to-user-namespace pbpaste | reattach-to-user-namespace pbcopy
	tmux display-message "Copied!"
else
	tmux display-message "Unsupported operating system: $OS"
	exit 1
fi
