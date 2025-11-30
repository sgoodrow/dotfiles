#!/bin/bash

# Get the current directory of the script
DOTFILES_DIR=$(PWD)

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
for HOME_FILE in "$DOTFILES_DIR/home/"*; do
    FILENAME=$(basename "$HOME_FILE")
    DEST="$HOME/.$FILENAME"

    # Create symlink and handle existing file
    create_symlink "$HOME_FILE" "$DEST"
done

# Function to install Brew packages from Brewfile
install_brew_packages() {
    local BREWFILE="$DOTFILES_DIR/brew/Brewfile"
    echo "Installing Brew packages from $BREWFILE..."
    brew bundle install --file="$BREWFILE"
}

# Install Brew packages from Brewfile
install_brew_packages

# Specific handling for VSCode settings
VS_SETTINGS="$DOTFILES_DIR/app/vscode-settings.json"
VS_SETTINGS_DEST="$HOME/Library/Application Support/Code/User/settings.json"

# Create symlink and handle existing VSCode settings file
create_symlink "$VS_SETTINGS" "$VS_SETTINGS_DEST"

# Function to install cron job for updating Brewfile
install_cron_job() {
    local SCRIPT_PATH="$DOTFILES_DIR/update-brewfile.sh"
    local CRON_COMMAND="0 0 * * * /bin/bash $SCRIPT_PATH"

    # Add the cron job
    (crontab -l ; echo "$CRON_COMMAND") | crontab -
    echo "Cron job installed to update Brewfile daily."
}

# Install cron job to update Brewfile daily
install_cron_job

echo "Symlinks and Brew packages installed successfully. Cron job installed."