#!/bin/bash

# Get the current directory of the script
SCRIPT_DIR=$(PWD)

# Function to create symlink and handle existing files
create_symlink() {
    local SRC=$1
    local DEST=$2

    # Check if destination already exists and is a symlink
    if [ -L "$DEST" ]; then
        echo "Symlink already exists at $DEST. Removing..."
        rm -f "$DEST"
    elif [ -e "$DEST" ]; then
        echo "File or directory already exists at $DEST. Removing..."
        rm -rf "$DEST"
    fi

    # Create the symlink
    ln -s "$SRC" "$DEST"
}

# Create symlinks for all files in home directory
for HOME_FILE in "$SCRIPT_DIR/home/"*; do
    FILENAME=$(basename "$HOME_FILE")
    DEST="$HOME/.$FILENAME"

    # Create symlink and handle existing file
    create_symlink "$HOME_FILE" "$DEST"
done

# Specific handling for VSCode settings
VS_SETTINGS="$SCRIPT_DIR/app/vscode-settings.json"
VS_SETTINGS_DEST="$HOME/Library/Application Support/Code/User/settings.json"

# Create symlink and handle existing VSCode settings file
create_symlink "$VS_SETTINGS" "$VS_SETTINGS_DEST"

echo "Symlinks created successfully."