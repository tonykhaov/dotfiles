#! /usr/bin/env bash

# setup.sh
chmod u+x ./setup.sh && ./setup.sh

# mas.sh
chmod u+x ./mas.sh && ./mas.sh

# brew.sh
chmod u+x ./brew.sh && ./brew.sh

# vscode.sh
chmod u+x ./vscode.sh && ./vscode.sh

# alfred.sh
chmod u+x ./alfred.sh && ./alfred.sh

# chrome-extensions.sh
chmod u+x ./chrome-extensions.sh && ./chrome-extensions.sh

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

# macos.sh
chmod u+x ./macos.sh && ./macos.sh