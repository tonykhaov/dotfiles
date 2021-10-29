#!/usr/bin/env bash

echo "Install necessary packages and config files"
chmod +x ./setup.sh && ./setup.sh

echo "Change macOS settings"
chmod +x ./macos.sh && ./macos.sh

echo "Install mac appsfrom the App Store with MAS"
chmod +x ./mas.sh && ./mas.sh

echo "Install additional Homebrew formulaes and casks"
chmod +x ./brew.sh && ./brew.sh

################################
# If you install them manually, make sure to have run mas.sh and brew.sh first

echo "Import vscode settings, snippets and keybindings"
chmod +x ./vscode.sh && ./vscode.sh

echo "Install chrome extensions"
chmod +x ./chrome-extensions.sh && ./chrome-extensions.sh

################################
# This must be run last
echo "Install oh-my-zsh and its pluginsw"
chmod +x ./oh-my-zsh.sh && ./oh-my-zsh.sh
