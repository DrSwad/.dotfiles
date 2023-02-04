#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Install mosh

## Detect OS
os=$(utils/os.sh) || exit 1

## Install mosh on macOS, if not installed already
if [[ $os == 'mac' ]]; then
  if ! type "mosh" &> /dev/null; then
    echo "-> Installing mosh... $WRENCH_EMOTE\n"
    brew install mosh
    echo "\n-> mosh installed $CHECK_EMOTE"
  else
    echo "-> mosh already installed $CHECK_EMOTE"
  fi
fi
