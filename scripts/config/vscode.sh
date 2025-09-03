#! /usr/bin/env bash

install_vscode_extensions() {
  echo "Install VSCode extensions from extensions list"
  local extensions_file="$HOME/Documents/Coding/dotfiles/scripts/config/vscode-extensions.txt"
  
  if [[ -f "$extensions_file" ]]; then
    while read -r extension; do
      [[ -n "$extension" ]] && code --install-extension "$extension"
    done < "$extensions_file"
  else
    echo "Extensions file not found: $extensions_file"
    return 1
  fi
}

import_snippets_keybindings_settings_to_vscode() {
  echo "Import snippets, keybindings and settings to vscode"
  local config_dir="$HOME/Documents/Coding/dotfiles/config/vscode"
  local vscode_user_dir="$HOME/Library/Application Support/Code/User"
  
  # Create VS Code user directory if it doesn't exist
  mkdir -p "$vscode_user_dir"

  # Remove existing files/symlinks
  rm -rf "$vscode_user_dir/keybindings.json"
  rm -rf "$vscode_user_dir/settings.json"
  rm -rf "$vscode_user_dir/snippets"

  # Create symlinks to config files
  ln -sf "$config_dir/keybindings.json" "$vscode_user_dir/keybindings.json"
  ln -sf "$config_dir/settings.json" "$vscode_user_dir/settings.json"
  ln -sf "$config_dir/snippets" "$vscode_user_dir/snippets"
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