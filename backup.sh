#!/bin/zsh

## Load backup configuration
source config.sh || exit 1

# Make '.dotfiles' the working directory, no matter from where the 'backup.sh'
# script was invoked
cd $(dirname $0)

# Make all the .sh files executable in the current directory
find . -type f -iname "*.sh" -exec chmod +x {} \;

## Make sure zsh is installed and is the default shell
utils/zsh.sh || exit 1

# Run the specialized backup scripts
neovim/backup.sh || exit 1
