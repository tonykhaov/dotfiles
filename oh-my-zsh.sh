#!/usr/bin/env bash

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Import zsh config"
rm -rf ~/.zshrc
ln -s ~/Documents/Coding/dotfiles/.zshrc ~/.zshrc
rm -rf ~/.zprofile
ln -s ~/Documents/Coding/dotfiles/.profile ~/.zprofile

echo "Install z"
brew install z

echo "Install zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Reload zsh"
source ~/.zshrc