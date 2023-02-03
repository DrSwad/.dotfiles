#!/bin/zsh

## Make '.dotfiles' the working directory, no matter from where the 'install.sh'
## script was invoked
cd $(dirname $0)

## Load installation configuration
source config.sh || exit 1

## Make all the .sh files executable in the current directory
find . -type f -iname "*.sh" -exec chmod +x {} \;

## Make sure zsh is installed and is the default shell
utils/zsh.sh || exit 1

## Run the specialized installation scripts
terminal_setup/install.sh || exit 1
fonts/install.sh || exit 1
oh-my-zsh/install.sh || exit 1
neovim/install.sh || exit 1
cp_setup/install.sh || exit 1
