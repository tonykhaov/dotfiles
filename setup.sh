#! /usr/bin/env bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

# Homebrew important formulaes
brew install git
brew install nvm
brew install python
brew install zsh z

# Install Node.js
[ ! -d ~/.nvm ] && mkdir ~/.nvm
printf "export NVM_DIR="$HOME/.nvm" \n [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  \n [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"" >> $HOME/.bash_profile
source $HOME/.bash_profile
nvm install node
nvm use node

# Fonts
brew tap homebrew/cask-fonts 
brew install --cask font-jetbrains-mono

# Import zsh config
cp ./.zshrc ~/.zshrc
source ~/.zshrc

# Import vim config
cp .vimrc ~/.vimrc

# Import ssh config
[ ! -d ~/.ssh ] && mkdir ~/.ssh
cp config ~/.ssh/config

# Import git config
cp ./.gitconfig ~/.gitconfig

# Copy /Stock and /Lab dir
[ ! -d ~/Documents/Coding ] && mkdir ~/Documents/Coding
cp -r ./Lab ~/Documents/Coding
cp -r ./Stock ~/Documents/Stock

# Accept Xcode license (for React-Native)
# sudo xcodebuild -license accept