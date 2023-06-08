#!/usr/bin/env bash

OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
    xsel -ip && xsel -op | xsel -ib
elif [ "$OS" = "Darwin" ]; then
    reattach-to-user-namespace pbpaste | reattach-to-user-namespace pbcopy
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

