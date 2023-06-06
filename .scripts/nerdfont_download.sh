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

# Define the font release page URL
RELEASES_URL="https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"

echo "[-] Downloading FiraCode and Iosevka Nerd fonts [-]"

# Function to get the latest version for a given font release page URL
get_latest_version() {
    local RELEASES_URL="$1"
    local LATEST_VERSION=$(curl -sSL "$RELEASES_URL" | jq -r '.tag_name')
    echo "$LATEST_VERSION"
}

# Get the latest version for FiraCode
FIRACODE_LATEST_VERSION=$(get_latest_version "$RELEASES_URL")
FIRACODE_DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$FIRACODE_LATEST_VERSION/FiraCode.zip"

echo "Downloading FiraCode version $FIRACODE_LATEST_VERSION"
wget -P "$HOME/Downloads/" "$FIRACODE_DOWNLOAD_URL"
echo "Unzipping FiraCode"
unzip -q "$HOME/Downloads/FiraCode.zip" -d "$TARGET_DIR"
echo "FiraCode installed!"

# Get the latest version for Iosevka
IOSEVKA_LATEST_VERSION=$(get_latest_version "$RELEASES_URL")
IOSEVKA_DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$IOSEVKA_LATEST_VERSION/Iosevka.zip"

echo "Downloading Iosevka version $IOSEVKA_LATEST_VERSION"
wget -P "$HOME/Downloads/" "$IOSEVKA_DOWNLOAD_URL"
echo "Unzipping Iosevka"
unzip -q "$HOME/Downloads/Iosevka.zip" -d "$TARGET_DIR"
echo "Iosevka installed!"

fc-cache -fv
echo "That's all! You may want to clear the Downloads now"
