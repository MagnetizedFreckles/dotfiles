#!/usr/bin/env bash

# Tmux helper script to source OS-specific options

OS=$(uname -s)

if [ "$OS" = "Linux" ]; then
    # Check if it's NixOS
    if [ -e /etc/NIXOS ]; then
        tmux source-file "$HOME/.tmux/nixos.conf"
    else
        tmux source-file "$HOME/.tmux/linux.conf"
    fi
elif [ "$OS" = "Darwin" ]; then
    tmux source-file "$HOME/.tmux/macos.conf"
fi
