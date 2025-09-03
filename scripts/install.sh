#!/usr/bin/env bash

setup_sh() {
  echo "Install necessary packages and config files"
  chmod +x ./setup.sh && ./setup.sh
}

mas_sh() {
  echo "Install mac appsfrom the App Store with MAS"
  chmod +x ./mas.sh && ./mas.sh
}

brew_sh() {
  echo "Install additional Homebrew formulaes and casks"
  chmod +x ./brew.sh && ./brew.sh
}

essential() {
  setup_sh
  mas_sh
  brew_sh
}

################################
# If you install them manually, make sure to have run mas.sh and brew.sh first

vscode_sh() {
  echo "Import vscode settings, snippets and keybindings"
  chmod +x ./vscode.sh && ./vscode.sh
}

chrome_extensions_sh() {
  echo "Install chrome extensions"
  chmod +x ./chrome-extensions.sh && ./chrome-extensions.sh
}

manual_settings() {
  vscode_sh
  chrome_extensions_sh  
}

################################
# This must be run last

macos_sh() {
  echo "Change macOS settings"
  chmod +x ./macos.sh && ./macos.sh
}

oh_my_zsh_sh() {
echo "Install oh-my-zsh and its plugins"
chmod +x ./oh-my-zsh.sh && ./oh-my-zsh.sh
}

must_run_last() {
  macos_sh
  oh_my_zsh_sh
}

main() {
  essential
  manual_settings
  must_run_last
}

main
