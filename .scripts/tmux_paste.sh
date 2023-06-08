#!/usr/bin/env bash

OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
    xclip -o | tmux load-buffer - ; tmux paste-buffer
elif [ "$OS" = "Darwin" ]; then
    reattach-to-user-namespace pbpaste | tmux load-buffer - ; tmux paste-buffer
else
    echo "Unsupported operating system: $OS"
    exit 1
fi
