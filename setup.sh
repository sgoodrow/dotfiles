#!/bin/bash

# Path to the dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Create symlinks for all files in home directory
for HOME_FILE in "$DOTFILES_DIR/home/"*; do
  FILENAME=$(basename "$HOME_FILE")
  DEST="$HOME/.$FILENAME"

  # Remove existing dotfile if it exists
  if [ -f "$DEST" ] || [ -d "$DEST" ]; then
    rm -rf "$DEST"
  fi

  # Create the symlink
  ln -s "$HOME_FILE" "$DEST"
done

# Specific handling for VSCode settings
ln -s "$DOTFILES_DIR/app/vscode-settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

echo "Symlinks created successfully."
