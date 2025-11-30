# Dotfiles

This repository contains my configuration files (dotfiles) for zsh, VSCode, and other tools. These dotfiles are managed using Git and symlinks for easy version control and portability.

## Installation

Run the setup script to create the symlinks:

```sh
./setup.sh
```

## Adding New Dotfiles

To add a new configuration file, move it to the `~/dotfiles/home` directory and rerun the `setup.sh` script.

## Updating Dotfiles

Simply git add and commit. The dotfiles are symlinked from the repository, so any changes to the installed dotfiles will be reflected in the repository and be ready for staging.

### Updating the Brewfile

After installing new Homebrew packages, casks, or VS Code extensions, update the `Brewfile` and `Brewfile.lock.json` by running:

```sh
./update-brewfile.sh
```

This will sync both files with your currently installed packages.
