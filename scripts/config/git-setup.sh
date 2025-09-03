#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/Documents/Coding/dotfiles"
CONFIG_DIR="$DOTFILES_DIR/config"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

configure_git() {
    echo -e "${BLUE}🔧 Git Configuration${NC}"
    echo ""
    
    # Prompt for git name
    read -p "Enter your full name for git commits: " git_name
    while [[ -z "$git_name" ]]; do
        echo -e "${YELLOW}Name cannot be empty. Please try again.${NC}"
        read -p "Enter your full name for git commits: " git_name
    done
    
    # Prompt for git email
    read -p "Enter your email for git commits: " git_email
    while [[ -z "$git_email" || ! "$git_email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; do
        echo -e "${YELLOW}Please enter a valid email address.${NC}"
        read -p "Enter your email for git commits: " git_email
    done
    
    echo ""
    echo -e "${YELLOW}Creating git configuration with:${NC}"
    echo "  Name: $git_name"
    echo "  Email: $git_email"
    echo ""
    
    # Create gitconfig from template
    local template_file="$CONFIG_DIR/git/.gitconfig.template"
    local target_file="$CONFIG_DIR/git/.gitconfig"
    
    if [[ -f "$template_file" ]]; then
        sed -e "s/__GIT_NAME__/$git_name/g" \
            -e "s/__GIT_EMAIL__/$git_email/g" \
            "$template_file" > "$target_file"
        
        echo -e "${GREEN}✓ Git configuration created successfully${NC}"
    else
        echo -e "${RED}✗ Template file not found: $template_file${NC}"
        return 1
    fi
    
    # Create symlink to ~/.gitconfig
    if [[ -e "$HOME/.gitconfig" && ! -L "$HOME/.gitconfig" ]]; then
        echo -e "${YELLOW}⚠️  Backing up existing ~/.gitconfig${NC}"
        mv "$HOME/.gitconfig" "$HOME/.gitconfig.backup"
    fi
    
    [[ -L "$HOME/.gitconfig" ]] && rm "$HOME/.gitconfig"
    ln -sf "$target_file" "$HOME/.gitconfig"
    
    echo -e "${GREEN}✓ Git configuration linked to ~/.gitconfig${NC}"
    echo ""
}

configure_git