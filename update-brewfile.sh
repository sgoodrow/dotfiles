#!/bin/bash

# Path to your dotfiles repository
DOTFILES_DIR=$(PWD)

# Brewfile location
BREWFILE="$DOTFILES_DIR/brew/Brewfile"

# Update Brewfile with currently installed packages
brew bundle dump --force --file="$BREWFILE"

# Update Brewfile.lock.json by running bundle install (won't install anything new, just updates lock)
cd "$DOTFILES_DIR/brew"
brew bundle install --file="$BREWFILE" --no-upgrade

