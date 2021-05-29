#! /usr/bin/env bash

# Install VScode extensions
code --install-extension bradlc.vscode-tailwindcss
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension GitHub.github-vscode-theme
code --install-extension GitHub.vscode-pull-request-github
code --install-extension heybourn.headwind
code --install-extension jasonnutter.search-node-modules
code --install-extension KnisterPeter.vscode-commitizen
code --install-extension leizongmin.node-module-intellisense
code --install-extension mhutchie.git-graph
code --install-extension ms-vscode.atom-keybindings
code --install-extension naumovs.color-highlight
code --install-extension PKief.material-icon-theme
code --install-extension ritwickdey.LiveServer
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscodevim.vim

# import snippets, keybindings and settings to vscode
chmod u+w+r vscode
cp -r ./vscode/* ~/Library/Application\ Support/Code/User/ 2> /dev/null

# Disable extensions so that you can enable only those you want to use
code --disable-extensions