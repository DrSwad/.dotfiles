#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Configure the terminal

## Detect OS
os=$(utils/os.sh) || exit 1

if [[ $os == 'mac' ]]; then
  ## Install iTerm2 on macOS, if not installed already
  if [ -d '/Applications/iTerm.app' ]; then
    echo "-> iTerm2 already installed $CHECK_EMOTE"
  else
    echo "-> Installing iTerm2... $WRENCH_EMOTE\n"
    brew install --cask iterm2
    echo "\n-> iTerm2 installed $CHECK_EMOTE"
  fi

  ## Setup iTerm2
  echo "-> Configure iTerm2:"
  echo "  -> 1. Make iTerm2 the default terminal (from the 'iTerm2' dropdown menu)."
  echo "  -> 2. Import the 'drswad.json' profile from '$(dirname $0)/mac' and make it the default one."
  echo ""
  read -s -k '?  Once configured, press any key to continue...'
  echo ' '$CHECK_EMOTE
fi
