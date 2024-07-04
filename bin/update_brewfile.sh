#!/bin/bash

# Path to your dotfiles repository
DOTFILES_DIR=$(PWD)

# Brewfile location
BREWFILE="$DOTFILES_DIR/brew/Brewfile"

# Update Brewfile
brew bundle dump --force --file="$BREWFILE"
