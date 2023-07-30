#!/usr/bin/env bash

# A script to paste in tmux buffer

OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
    # xclip -o | tmux load-buffer - ; tmux paste-buffer
    cb paste | tmux load-buffer - ; tmux paste-buffer
    tmux display-message "Pasted!"
elif [ "$OS" = "Darwin" ]; then
    reattach-to-user-namespace pbpaste | tmux load-buffer - ; tmux paste-buffer
    tmux display-message "Pasted!"
else
    tmux display-message "Unsupported operating system: $OS"
    exit 1
fi
