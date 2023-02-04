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
if [[ $MODE == "FULL" ]]; then
  terminal_setup/install.sh || exit 1
fi
fonts/install.sh || exit 1
if [[ $MODE == "FULL" ]]; then
  oh-my-zsh/install.sh || exit 1
else
  zshrc_file=$HOME'/.zshrc'
  echo "\nCP_HOME=$CP_HOME" >> $zshrc_file
  echo "CP_SETUP=$CP_SETUP" >> $zshrc_file
fi
neovim/install.sh || exit 1
cp_setup/install.sh || exit 1
