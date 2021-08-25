#!/usr/bin/env bash

# Set computer name
read -p "Enter name: [tonykhaov]" name
name=${name:-tonykhaov}
sudo scutil --set HostName $name
sudo scutil --set LocalHostName $name
sudo scutil --set ComputerName $name
dscacheutil -flushcache
echo "Computer name changed to $name"

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Install git, nvm, python, zsh & z"
brew install git
brew install nvm
brew install python
brew install zsh z

echo "Install node"
[ ! -d ~/.nvm ] && mkdir ~/.nvm
nvm install node
nvm use node

echo "Install Jetbrains Mono Font"
brew tap homebrew/cask-fonts 
brew install --cask font-jetbrains-mono

echo "Import zsh config, vim config & gitconfig"
cp ./.zshrc ~/.zshrc
echo `export ZSH="/Users/$name/.oh-my-zsh"` >> ~/.zshrc
source ~/.zshrc
cp .vimrc ~/.vimrc
cp ./.gitconfig ~/.gitconfig

echo "Import Stock dir inside ~/Documents/Coding"
[ ! -d ~/Documents/Coding ] && mkdir ~/Documents/Coding
cp -r ./Lab ~/Documents/Coding
echo "Import Lab dir inside ~/Documents"
cp -r ./Stock ~/Documents

echo "Import youtube-dl config"
[ ! -d ~/.config ] && mkdir ~/.config
[ ! -d ~/.config/youtube-dl ] && mkdir ~/.config/youtube-dl
cp ./youtube-dl/config ~/.config/youtube-dl

echo "Generating a new SSH key for GitHub"
ssh-keygen -t ed25519 -C "tony.khaov@gmail.com" -f ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"