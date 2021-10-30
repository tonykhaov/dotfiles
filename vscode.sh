#! /usr/bin/env bash

echo "Install VScode extensions"
code --install-extension bradlc.vscode-tailwindcss
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension GitHub.github-vscode-theme
code --install-extension GitHub.vscode-pull-request-github
code --install-extension heybourn.headwind
code --install-extension jasonnutter.search-node-modules
code --install-extension KnisterPeter.vscode-commitizen
code --install-extension leizongmin.node-module-intellisense
code --install-extension mhutchie.git-graph
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode.atom-keybindings
code --install-extension naumovs.color-highlight
code --install-extension patbenatar.advanced-new-file
code --install-extension PKief.material-icon-theme
code --install-extension ritwickdey.LiveServer
code --install-extension sleistner.vscode-fileutils
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscodevim.vim
code --install-extension inu1255.easy-snippet
code --install-extension usernamehw.errorlens
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension denoland.vscode-deno
code --install-extension wayou.vscode-todo-highlight

echo "Import snippets, keybindings and settings to vscode"
chmod u+w+r vscode

rm -rf ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/Documents/Coding/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

rm -rf ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/Documents/Coding/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

rm -rf ~/Library/Application\ Support/Code/User/snippets
ln -s ~/Documents/Coding/dotfiles/vscode/snippets/ ~/Library/Application\ Support/Code/User/snippets

echo "Enable long press key for vscodevim extension"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
