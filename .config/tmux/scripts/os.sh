#!/usr/bin/env bash

# Tmux helper script to source OS-specific options

OS=$(uname -s)

if [ "$OS" = "Linux" ]; then
	# Check if it's NixOS
	if [ -e /etc/NIXOS ]; then
		tmux source-file "$HOME/.config/tmux/os_configs/nixos.conf"
	else
		tmux source-file "$HOME/.config/tmux/os_configs/linux.conf"
	fi
elif [ "$OS" = "Darwin" ]; then
	tmux source-file "$HOME/.config/tmux/os_configs/macos.conf"
fi
