#!/usr/bin/env bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/Documents/Coding/dotfiles"

# Helper function to print step headers
print_step() {
    echo -e "\n${BLUE}==== $1 ====${NC}\n"
}

# Helper function to run scripts with error handling
run_script() {
    local script="$1"
    local description="$2"
    
    if [[ -f "$script" ]]; then
        echo -e "${YELLOW}Running: $description${NC}"
        chmod +x "$script"
        "$script"
        echo -e "${GREEN}✓ Completed: $description${NC}"
    else
        echo -e "${RED}✗ Script not found: $script${NC}"
        return 1
    fi
}

# Main installation flow
main() {
    echo -e "${GREEN}"
    echo "  ████████   ████████ ████████ ████████ ████ ████   ████████  ████████"
    echo " ██      ██ ██    ██    ██    ██       ██   ██  ██ ██        ██"      
    echo " ██      ██ ██    ██    ██    ████     ██   ██  ██ ████      ████"
    echo " ██      ██ ██    ██    ██    ██       ██   ██  ██ ██             ██"
    echo "  ████████   ████████    ██    ██       ████ ██  ██  ████████ ████████"
    echo -e "${NC}"
    echo -e "${BLUE}Tony's macOS Setup & Dotfiles Configuration${NC}"
    echo ""
    
    # Step 1: Essential installations
    print_step "Installing Essential Tools"
    run_script "$DOTFILES_DIR/scripts/install/essentials.sh" "Essential tools (Homebrew, Git, Node, etc.)"
    
    # Step 2: Configure git with user input
    print_step "Configuring Git"
    run_script "$DOTFILES_DIR/scripts/config/git-setup.sh" "Setting up git with your name and email"

    # Step 3: Install applications
    print_step "Installing Applications"
    run_script "$DOTFILES_DIR/scripts/install/brew.sh" "Homebrew applications"
    
    # Step 4: Install oh-my-zsh and configure shell
    print_step "Installing Oh My Zsh"
    run_script "$DOTFILES_DIR/scripts/config/oh-my-zsh.sh" "Oh My Zsh and shell configuration"

    # Step 5: Create symlinks for dotfiles
    print_step "Setting Up Configuration Files"
    run_script "$DOTFILES_DIR/scripts/config/symlinks.sh" "Creating symlinks for dotfiles"

    # Step 6: Configure applications
    print_step "Configuring Applications"
    run_script "$DOTFILES_DIR/scripts/config/vscode.sh" "VS Code extensions and settings"
    run_script "$DOTFILES_DIR/scripts/config/chrome-extensions.sh" "Chrome extensions"

    # Step 7: System configuration (run last)
    print_step "Configuring macOS System Settings"
    run_script "$DOTFILES_DIR/scripts/config/macos.sh" "macOS system preferences"

    # Step 8: Installing Mac App Store apps
    print_step "Installing Mac App Store Applications"
    run_script "$DOTFILES_DIR/scripts/install/mas.sh" "Mac App Store applications"

    # Final message
    echo ""
    echo -e "${GREEN}🎉 Setup completed successfully!${NC}"
    echo ""
    echo -e "${YELLOW}Manual steps remaining (see docs/manual-setup.md):${NC}"
    echo "  • System Preferences: Keyboard, Trackpad, Finder settings"
    echo "  • 1Password: Remove shortcuts"
    echo "  • Import browser bookmarks"
    echo "  • Configure Raycast settings"
    echo ""
    echo -e "${BLUE}Restart your terminal or run 'exec zsh' to load new shell configuration.${NC}"
}

# Check if we're in the right directory
if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo -e "${RED}Error: Dotfiles directory not found at $DOTFILES_DIR${NC}"
    exit 1
fi

cd "$DOTFILES_DIR"
main "$@"