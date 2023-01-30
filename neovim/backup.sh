#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Backup NvChad custom configs
NvChadCustom=$HOME/.config/nvim/lua/custom
rsync -a --delete $NvChadCustom/ neovim/custom/ || exit 1
echo "  -> Custom NvChad configs backed up $CHECK_EMOTE"
