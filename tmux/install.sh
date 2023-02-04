#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Install tmux

## Detect OS
os=$(utils/os.sh) || exit 1

## Install tmux on macOS, if not installed already
if [[ $os == 'mac' ]]; then
  if ! type "tmux" &> /dev/null; then
    echo "-> Installing tmux... $WRENCH_EMOTE\n"
    brew install tmux
    echo "\n-> tmux installed $CHECK_EMOTE"
  else
    echo "-> tmux already installed $CHECK_EMOTE"
  fi
fi
