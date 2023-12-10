#!/usr/bin/env bash

# Set the target location for unzipping based on the operating system
OS=$(uname -s)
if [ "$OS" = "Linux" ]; then
	TARGET_DIR="$HOME/.local/share/fonts"
elif [ "$OS" = "Darwin" ]; then
	TARGET_DIR="$HOME/Library/Fonts"
else
	echo "Unsupported operating system: $OS"
	exit 1
fi

echo "[-] Downloading FiraCode and Iosevka Nerd fonts [-]"

# Get the latest version for FiraCode
FIRACODE_DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"

echo "Downloading FiraCode latest version"
wget -P "$HOME/Downloads/" "$FIRACODE_DOWNLOAD_URL"
echo "Unzipping FiraCode"
unzip -q "$HOME/Downloads/FiraCode.zip" -d "$TARGET_DIR"
echo "FiraCode installed!"

# Get the latest version for Iosevka
IOSEVKA_DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.zip"

echo "Downloading Iosevka latest version"
wget -P "$HOME/Downloads/" "$IOSEVKA_DOWNLOAD_URL"
echo "Unzipping Iosevka"
unzip -q "$HOME/Downloads/Iosevka.zip" -d "$TARGET_DIR"
echo "Iosevka installed!"

fc-cache -fv
echo "That's all! You may want to clear the Downloads now"
