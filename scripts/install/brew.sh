#!/usr/bin/env bash

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# CLI tools and utilities
install_cli_tools() {
    echo -e "${BLUE}Installing CLI tools...${NC}"
    
    local cli_tools=(
        "ffmpeg"
        "gs"
        "jq"
        "imagemagick"
        "yt-dlp"
        "trash"
        "git-delta"
        "fzf"
    )
    
    for tool in "${cli_tools[@]}"; do
        echo "Installing $tool..."
        brew install "$tool"
    done
    
    echo -e "${GREEN}✓ CLI tools installed${NC}"
}

# GUI applications (casks)
install_gui_applications() {
    echo -e "${BLUE}Installing GUI applications...${NC}"
    
    local gui_apps=(
        "1password"
        "android-studio"
        "alt-tab"
        "anki"
        "betterdisplay"
        "calibre"
        "cap"
        "discord"
        "dropzone"
        "figma"
        "google-chrome"
        "notion"
        "orbstack"
        "raycast"
        "soundsource"
        "spotify"
        "visual-studio-code"
    )
    
    for app in "${gui_apps[@]}"; do
        echo "Installing $app..."
        brew install --cask "$app"
    done
    
    echo -e "${GREEN}✓ GUI applications installed${NC}"
}

# Fonts
install_fonts() {
    echo -e "${BLUE}Installing fonts...${NC}"
    
    local fonts=(
        "font-ubuntu"
        "font-poppins"
        "font-jetbrains-mono"
        "font-open-sans"
        "font-roboto"
        "font-inter"
        "font-lato"
        "font-noto-sans"
    )
    
    for font in "${fonts[@]}"; do
        echo "Installing $font..."
        brew install --cask "$font"
    done
    
    echo -e "${GREEN}✓ Fonts installed${NC}"
}

# Setup FZF shell integration
setup_fzf() {
    echo -e "${BLUE}Setting up FZF shell integration...${NC}"
    "$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish
    echo -e "${GREEN}✓ FZF configured${NC}"
}

# Open applications that need initial setup
open_setup_applications() {
    echo -e "${BLUE}Opening applications that need initial setup...${NC}"
    
    local apps_to_open=(
        "OrbStack"
        "Raycast"
    )
    
    for app in "${apps_to_open[@]}"; do
        if brew list --cask "${app,,}" &>/dev/null; then
            echo "Opening $app..."
            open -a "$app"
        fi
    done
    
    echo -e "${GREEN}✓ Applications opened for setup${NC}"
}

main() {
    echo -e "${YELLOW}🍺 Installing Homebrew packages and applications${NC}"
    echo ""
    
    install_cli_tools
    install_gui_applications
    install_fonts
    setup_fzf
    open_setup_applications
    
    echo ""
    echo -e "${GREEN}🎉 All Homebrew packages installed successfully!${NC}"
}

main "$@"
