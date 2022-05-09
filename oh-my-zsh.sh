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

echo "Install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "Install you-should-use"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use

echo "Install zsh-nvm"
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

echo "Reload zsh"
source ~/.zshrc