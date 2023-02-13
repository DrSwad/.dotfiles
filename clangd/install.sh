#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Setup clangd

## Put the clangd configuration file in the home directory
cp clangd/.clangd $HOME

## Replace env varialbles with their full forms in .clangd
sed -i '' "s#\$CP_SETUP#$CP_SETUP#g" $HOME/.clangd
sed -i '' "s#\$BREW_CELLAR#$(brew --cellar)#g" $HOME/.clangd

echo "-> clangd configured $CHECK_EMOTE"
