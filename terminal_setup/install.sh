#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

# Configure the terminal

## Detect OS
os=$(utils/os.sh) || exit 1

## Install and setup iTerm2 on macOS, if not installed already
if [[ $os == 'mac' ]]; then
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

### Install zoxide, if not already installed
if ! type "zoxide" &> /dev/null; then
  echo "-> Installing zoxide... $WRENCH_EMOTE\n"
  if [[ $os == 'mac' ]]; then
    brew install zoxide
  else
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
  fi
  echo "\n-> zoxide installed $CHECK_EMOTE"
else
  echo "-> zoxide already installed $CHECK_EMOTE"
fi

### Install fzf, if not already installed
if ! type "fzf" &> /dev/null; then
  echo "-> Installing fzf... $WRENCH_EMOTE\n"
  if [[ $os == 'mac' ]]; then
    brew install fzf
    $(brew --prefix)/opt/fzf/install
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  fi
  echo "\n-> fzf installed $CHECK_EMOTE"
else
  echo "-> fzf already installed $CHECK_EMOTE"
fi
