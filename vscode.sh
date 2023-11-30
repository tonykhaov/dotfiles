#! /usr/bin/env bash

install_vscode_extensions() {
  echo "Install VScode extensions"
  code --install-extension christian-kohler.npm-intellisense
  code --install-extension christian-kohler.path-intellisense
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension eamodio.gitlens
  code --install-extension EditorConfig.EditorConfig
  code --install-extension esbenp.prettier-vscode
  code --install-extension formulahendry.auto-rename-tag
  code --install-extension GitHub.vscode-pull-request-github
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
  code --install-extension silvenon.mdx
  code --install-extension mattpocock.ts-error-translator
  code --install-extension Gruntfuggly.todo-tree
  code --install-extension ms-playwright.playwright
  code --install-extension tal7aouy.theme
  code --install-extension chakra-ui.panda-css-vscode
}

import_snippets_keybindings_settings_to_vscode() {
  echo "Import snippets, keybindings and settings to vscode"
  chmod u+w+r vscode

  rm -rf ~/Library/Application\ Support/Code/User/keybindings.json
  ln -sf ~/Documents/Coding/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

  rm -rf ~/Library/Application\ Support/Code/User/settings.json
  ln -sf ~/Documents/Coding/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

  rm -rf ~/Library/Application\ Support/Code/User/snippets
  ln -s ~/Documents/Coding/dotfiles/vscode/snippets/ ~/Library/Application\ Support/Code/User/snippets
}

enable_long_press_key_for_vscodevim_extension() {
  echo "Enable long press key for vscodevim extension"
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
  defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false         # For VS Codium
  defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
}

main() {
  install_vscode_extensions
  import_snippets_keybindings_settings_to_vscode
  enable_long_press_key_for_vscodevim_extension 
}

main