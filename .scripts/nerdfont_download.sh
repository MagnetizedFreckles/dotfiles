#!/usr/bin/env bash

# Set the target location for unzipping based on the operating system
OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
	TARGET_DIR="$HOME/.local/share/fonts/"
elif [ "$OS" = "Darwin" ]; then
	TARGET_DIR="$HOME/Library/Fonts/"
else
	echo "Unsupported operating system: $OS"
	exit 1
fi

echo "[-] Downloading FiraCode, Iosevka and Monaspace Nerd fonts [-]"

FIRACODE_DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz"
echo "Downloading latest version of FiraCode"
wget -P "$HOME/Downloads/" "$FIRACODE_DOWNLOAD_URL"
echo "Unzipping FiraCode"
tar -xf "$HOME/Downloads/FiraCode.tar.xz" -C "$TARGET_DIR" --xz
echo "FiraCode installed!"

IOSEVKA_DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz"
echo "Downloading latest version of Iosevka"
wget -P "$HOME/Downloads/" "$IOSEVKA_DOWNLOAD_URL"
echo "Unzipping Iosevka"
tar -xf "$HOME/Downloads/FiraCode.tar.xz" -C "$TARGET_DIR" --xz
echo "Iosevka installed!"

MONASPACE_DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Monaspace.tar.xz"
echo "Downloading latest version of Monaspace"
wget -P "$HOME/Downloads/" "$MONASPACE_DOWNLOAD_URL"
echo "Unzipping Monaspace"
tar -xf "$HOME/Downloads/Monaspace.tar.xz" -C "$TARGET_DIR" --xz
echo "Monaspace installed!"

fc-cache -fv
echo "That's all! You may want to clear the Downloads now"
