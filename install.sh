#! /usr/bin/env bash

echo "Install necessary packages and config files"
chmod u+x ./setup.sh && ./setup.sh

echo "Change macOS settings"
chmod u+x ./macos.sh && ./macos.sh

echo "Install mac appsfrom the App Store with MAS"
chmod u+x ./mas.sh && ./mas.sh

echo "Install additional Homebrew formulaes and casks"
chmod u+x ./brew.sh && ./brew.sh

################################
# If you install them manually, make sure to have run mas.sh and brew.sh first

echo "Import vscode settings, snippets and keybindings"
chmod u+x ./vscode.sh && ./vscode.sh

echo "Import alfred custom searches and workflows"
chmod u+x ./alfred.sh && ./alfred.sh

echo "Install chrome extensions"
chmod u+x ./chrome-extensions.sh && ./chrome-extensions.sh