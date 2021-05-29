#! /usr/bin/env bash

# setup.sh
chmod u+x ~/Downloads/dotfiles-main/setup.sh
~/Downloads/dotfiles-main/setup.sh

# mas.sh
chmod u+x ~/Downloads/dotfiles-main/mas.sh
~/Downloads/dotfiles-main/mas.sh

# brew.sh
chmod u+x ~/Downloads/dotfiles-main/brew.sh
~/Downloads/dotfiles-main/brew.sh

# vscode.sh
chmod u+x ~/Downloads/dotfiles-main/vscode.sh
~/Downloads/dotfiles-main/vscode.sh

# TODO: prompt the user if he wants these dir
# stock and lab
cp -r ./Stock ~/Documents/Stock
mkdir ~/Documents/Coding
cp -r ./Lab ~/Documents/Coding/Lab