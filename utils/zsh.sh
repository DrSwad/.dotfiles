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
