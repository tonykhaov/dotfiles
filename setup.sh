#! /usr/bin/env bash

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install Homebrew"
if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

echo "Install git, nvm, python, zsh & z"
brew install git
brew install nvm
brew install python
brew install zsh z

echo "Install node"
[ ! -d ~/.nvm ] && mkdir ~/.nvm
printf "export NVM_DIR="$HOME/.nvm" \n [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  \n [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"" >> $HOME/.bash_profile
source $HOME/.bash_profile
nvm install node
nvm use node

echo "Install Jetbrains Mono Font"
brew tap homebrew/cask-fonts 
brew install --cask font-jetbrains-mono

echo "Import zsh config, vim config & gitconfig"
cp ./.zshrc ~/.zshrc
source ~/.zshrc
cp .vimrc ~/.vimrc
cp ./.gitconfig ~/.gitconfig

echo "Import Stock dir inside ~/Documents/Coding"
[ ! -d ~/Documents/Coding ] && mkdir ~/Documents/Coding
cp -r ./Lab ~/Documents/Coding
echo "Import Lab dir inside ~/Documents"
cp -r ./Stock ~/Documents

echo "Generating a new SSH key for GitHub"
ssh-keygen -t ed25519 -C "tony.khaov@gmail.com" -f ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"