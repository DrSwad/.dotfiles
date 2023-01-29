#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

## Detect OS
os=$(utils/os.sh) || exit 1

# Install a Nerd Font

## Construct the system font directory based on OS
if [[ $os == 'mac' ]]; then
  font_directory=$HOME'/Library/Fonts'
else
  font_directory=$HOME'/.local/share/fonts'
fi

## Create the font directory if it doesn't already exist
mkdir -p $font_directory

## Copy the fonts in the system font directory of OS
cp -r fonts/. $font_directory

## Remove the installation script from the system font directory
rm $font_directory'/install.sh'

echo "-> Copied font files to the system font directory ('$font_directory') $CHECK_EMOTE"
