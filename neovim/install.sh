#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Handle Neovim

## Make sure Neovim is installed
if ! type "nvim" &> /dev/null; then
  echo "-> Install Neovim to continue. Find installation instructions here: https://github.com/neovim/neovim/wiki/Installing-Neovim. Aborting $CROSS_EMOTE"
  exit 1
fi

## Inform about the Neovim version
echo "-> Make sure your Neovim version is at least v0.8.0 to continue. Current version log:\n"
nvim --version
echo ''
read -s -k '?-> Once ensured, press any key to continue...'
echo ' '$CHECK_EMOTE

# Handle NvChad

## Install NvChad, if not installed already
if [ -d "$HOME/.config/nvim/.git" ]; then
  NvimRepo=$(git -C $HOME/.config/nvim ls-remote --get-url origin)
fi
NvChadRepo=https://github.com/NvChad/NvChad
if [[ $NvimRepo == $NvChadRepo ]]; then
  echo "-> NvChad already installed $CHECK_EMOTE Setting it up... $WRENCH_EMOTE"
else
  echo "-> Installing NvChad... $WRENCH_EMOTE\n"
  rm -rf $HOME/.local/share/nvim $HOME/.config/nvim || exit 1
  git clone https://github.com/NvChad/NvChad $HOME/.config/nvim --depth 1 || exit 1
  echo "\n-> NvChad installed $CHECK_EMOTE setting it up... $WRENCH_EMOTE"
fi

## Setup NvChad
NvChadCustom=$HOME/.config/nvim/lua/custom
rsync -a --delete neovim/custom/ $NvChadCustom/ || exit 1
echo "  -> Custom NvChad configs set $CHECK_EMOTE"
