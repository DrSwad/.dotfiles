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
  oh-my-zsh/install.sh || exit 1
  tmux/install.sh || exit 1
fi

if [[ $MODE == "CP" ]]; then
  zshrc_file=$HOME'/.zshrc'
  echo "\nCP_HOME=$CP_HOME" >> $zshrc_file
  echo "CP_SETUP=$CP_SETUP" >> $zshrc_file
  echo "\n-> CP aliases set in $zshrc_file $CHECK_EMOTE"
fi

fonts/install.sh || exit 1
neovim/install.sh || exit 1
cp_setup/install.sh || exit 1
