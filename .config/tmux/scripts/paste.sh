#!/usr/bin/env bash

# A script to paste in tmux buffer
# This mostly DOESN'T work. And I honestly have zero need in this script.
# Ctrl-Shift-V does the good enough job

OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
	# Works in my case, but here is another way of checking, may be useful:
	# https://unix.stackexchange.com/questions/202891/how-to-know-whether-wayland-or-x11-is-being-used
	if [ "$XDG_SESSION_TYPE" = "x11" ]; then
		xclip -o | tmux load-buffer -
		tmux paste-buffer
		tmux display-message "Pasted!"
	elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
		wl-paste | tmux load-buffer -
		tmux paste-buffer
		tmux display-message "Pasted!"
	fi
elif [ "$OS" = "Darwin" ]; then
	reattach-to-user-namespace pbpaste | tmux load-buffer -
	tmux paste-buffer
	tmux display-message "Pasted!"
else
	tmux display-message "Unsupported operating system: $OS"
	exit 1
fi
