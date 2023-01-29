#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

## Detect OS
os=$(utils/os.sh) || exit 1

# Install oh-my-zsh

## Install oh-my-zsh, if not already installed
if [ -d $ZSH ]; then
  echo "-> oh-my-zsh already installed $CHECK_EMOTE Setting it up... $WRENCH_EMOTE"
else
  echo "-> Installing oh-my-zsh... $WRENCH_EMOTE\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "\n-> oh-my-zsh installed $CHECK_EMOTE setting it up... $WRENCH_EMOTE"
fi

# Setup oh-my-zsh

zshrc_file=$HOME'/.zshrc'

## Set the theme
sed -i '' "s/^\(ZSH_THEME=\).*$/\1$ZSH_THEME/" $zshrc_file

## Set plugins
sed -i '' "s/^\(plugins=\).*$/\1$ZSH_PLUGINS/" $zshrc_file

## Set the preferred editors for local and remote sessions
sed -i '' '85s/^# \(if \[\[ -n $SSH_CONNECTION \]\]; then\)$/\1/' $zshrc_file
sed -i '' "86s/^# \(  export EDITOR=\)'vim'$/\1'nvim'/" $zshrc_file
sed -i '' '87s/^# \(else\)$/\1/' $zshrc_file
sed -i '' "88s/^# \(  export EDITOR=\)'mvim'$/\1'nvim'/" $zshrc_file
sed -i '' '89s/^# \(fi\)$/\1/' $zshrc_file

echo "  -> .zshrc profile set $CHECK_EMOTE"

## Put custom scripts

### Construct the 1_homebrew.sh script
if [[ $os == 'mac' ]]; then
  echo 'eval "$(brew shellenv)"' > oh-my-zsh/custom/1_homebrew.zsh
else
  echo '' > oh-my-zsh/custom/1_homebrew.zsh
fi

### Construct the 2_cp_aliases.sh script
echo 'CP_HOME='$CP_HOME > oh-my-zsh/custom/2_cp_aliases.zsh
echo 'CP_SETUP='$CP_SETUP >> oh-my-zsh/custom/2_cp_aliases.zsh

### Finally, put all the custom scripts, theme and plugins
rsync -a --delete oh-my-zsh/custom/ $ZSH_CUSTOM/ || exit 1
echo "  -> Custom scripts, theme and plugins set $CHECK_EMOTE"
