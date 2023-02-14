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

## Configure the .zshrc file

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

### Put the zoxide init command at the bottom of .zshrc
zoxide_init_cmd='eval "$(zoxide init zsh)"'
if ! grep -q "$zoxide_init_cmd" "$zshrc_file" ; then
  echo "\n$zoxide_init_cmd" >> $zshrc_file
fi

echo "  -> .zshrc profile set $CHECK_EMOTE"

## Put custom scripts

### Put all the custom scripts, theme and plugins
rsync -a --delete oh-my-zsh/custom/ $ZSH_CUSTOM/ || exit 1
echo "  -> Custom scripts, theme and plugins set $CHECK_EMOTE"

### Construct the 1_homebrew.zsh script
if [[ $os == 'mac' ]]; then
  if [ -d '/opt/homebrew/bin' ]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > $ZSH_CUSTOM/1_homebrew.zsh
  else
    echo 'eval "$(/usr/local/bin/brew shellenv)"' > $ZSH_CUSTOM/1_homebrew.zsh
  fi
else
  echo '' > $ZSH_CUSTOM/1_homebrew.zsh
fi

### Construct the 2_cp_aliases.zsh script
echo 'export CP_HOME='$CP_HOME > $ZSH_CUSTOM/2_cp_aliases.zsh
echo 'export CP_SETUP='$CP_SETUP >> $ZSH_CUSTOM/2_cp_aliases.zsh

### Construct the 3_g++.zsh script
arch_dir=$(ls $(brew --cellar)/gcc/12.2.0/lib/gcc/current/gcc | head -1)
sed -i '' "s#\$BREW_CELLAR#$(brew --cellar)#g" $ZSH_CUSTOM/3_g++.zsh
sed -i '' "s#\$ARCH_DIR#$arch_dir#g" $ZSH_CUSTOM/3_g++.zsh

### Construct the pyenv.zsh script, only if pyenv is installed
if ! type "pyenv" &> /dev/null; then
  echo '' > $ZSH_CUSTOM/pyenv.zsh
else
  echo '# python binaries' > $ZSH_CUSTOM/pyenv.zsh
  echo 'export PATH=$(pyenv root)/shims:$PATH' >> $ZSH_CUSTOM/pyenv.zsh
fi

### Construct the python_binaries.zsh script, only if on mac
if [[ $os == 'mac' ]]; then
  echo '# python binaries' > $ZSH_CUSTOM/python_binaries.zsh
  find $HOME/Library/Python/[!/]*/bin -type d | while read -r line; do
    echo 'export PATH='$line':$PATH' >> $ZSH_CUSTOM/python_binaries.zsh
  done
else
  echo '' > $ZSH_CUSTOM/python_binaries.zsh
fi
