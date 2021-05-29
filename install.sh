#! /usr/bin/env bash

# setup.sh
chmod u+x ./setup.sh
./setup.sh

# mas.sh
chmod u+x ./mas.sh
./mas.sh

# brew.sh
chmod u+x ./brew.sh
./brew.sh

# vscode.sh
chmod u+x ./vscode.sh
./vscode.sh

# TODO: prompt the user if he wants these dir
# stock and lab
cp -r ./Stock ~/Documents/Stock
mkdir ~/Documents/Coding
cp -r ./Lab ~/Documents/Coding/Lab