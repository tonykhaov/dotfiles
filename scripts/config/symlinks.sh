#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/Documents/Coding/dotfiles"
CONFIG_DIR="$DOTFILES_DIR/config"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to safely create symlinks
link_config() {
    local source="$1"
    local target="$2"
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Backup existing file if it's not a symlink
    if [[ -e "$target" && ! -L "$target" ]]; then
        echo -e "${YELLOW}⚠️  Backing up existing $target to ${target}.backup${NC}"
        mv "$target" "${target}.backup"
    fi
    
    # Remove existing symlink
    [[ -L "$target" ]] && rm "$target"
    
    # Create symlink
    ln -sf "$source" "$target"
    echo -e "${GREEN}✓ Linked $target -> $source${NC}"
}

echo "🔗 Creating symlinks for dotfiles..."
echo ""

# Shell configs
link_config "$CONFIG_DIR/shell/.zshrc" "$HOME/.zshrc"
link_config "$CONFIG_DIR/shell/.zprofile" "$HOME/.zprofile"

# Git config is handled by git-setup.sh script (prompts for user info)

# Vim config
link_config "$CONFIG_DIR/vim/.vimrc" "$HOME/.vimrc"

# Kitty config
link_config "$CONFIG_DIR/kitty" "$HOME/.config/kitty"

# YouTube-dl config
link_config "$CONFIG_DIR/youtube-dl" "$HOME/.config/youtube-dl"

# Stock resources
link_config "$DOTFILES_DIR/resources/stock" "$HOME/Documents/Stock"

echo ""
echo -e "${GREEN}🎉 All symlinks created successfully!${NC}"