#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Make '.dotfiles' the working directory, no matter from where the 'install.sh'
# script was invoked
cd $(dirname $0)

## Make sure zsh is installed
if ! type "zsh" &> /dev/null; then
  echo "-> Install zsh to continue. Find installation instructions here: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH. Aborting $CROSS_EMOTE"
  exit 1
fi

## Make sure zsh is the default shell
if [[ $SHELL != *zsh* ]]; then
  echo "-> Make zsh the default shell to continue. Find the instructions here: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH. Aborting $CROSS_EMOTE"
  exit 1
fi

# Make all the .sh files executable in the current directory
find . -type f -iname "*.sh" -exec chmod +x {} \;

# Run the specialized installation scripts
terminal_setup/install.sh || exit 1
fonts/install.sh || exit 1
oh-my-zsh/install.sh || exit 1
neovim/install.sh || exit 1
cp_setup/install.sh || exit 1
