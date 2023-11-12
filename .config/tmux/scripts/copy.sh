#!/usr/bin/env bash

# A script to copy from tmux buffer

OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
	xsel -ip && xsel -op | xsel -ib
	#cb copy
	tmux display-message "Copied!"
elif [ "$OS" = "Darwin" ]; then
	reattach-to-user-namespace pbpaste | reattach-to-user-namespace pbcopy
	tmux display-message "Copied!"
else
	tmux display-message "Unsupported operating system: $OS"
	exit 1
fi
