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

# Interactive selection
select_steps() {
    local steps=("essentials" "git" "brew" "ohmyzsh" "symlinks" "vscode" "chrome" "macos" "mas")
    local descriptions=("Essential tools (Homebrew, Git, Node, etc.)" "Setting up git with your name and email" "Homebrew applications" "Oh My Zsh and shell configuration" "Creating symlinks for dotfiles" "VS Code extensions and settings" "Chrome extensions" "macOS system preferences" "Mac App Store applications")

    echo -e "${YELLOW}Select which scripts to run:${NC}"
    for i in "${!steps[@]}"; do
        echo "$((i+1)). ${descriptions[i]}"
    done
    echo "a. Run all"
    echo ""

    read -p "Enter numbers separated by space (or 'a' for all): " choice

    if [[ "$choice" == "a" || "$choice" == "all" ]]; then
        steps_to_run=("${steps[@]}")
    else
        IFS=' ' read -ra nums <<< "$choice"
        for num in "${nums[@]}"; do
            if [[ $num =~ ^[0-9]+$ ]] && (( num >= 1 && num <= ${#steps[@]} )); then
                steps_to_run+=("${steps[$((num-1))]}")
            fi
        done
    fi

    if [[ ${#steps_to_run[@]} -eq 0 ]]; then
        echo -e "${YELLOW}No valid selections. Running all by default.${NC}"
        steps_to_run=("${steps[@]}")
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

    # Interactive selection
    select_steps

    # Step 1: Essential installations
    if [[ " ${steps_to_run[*]} " == *" essentials "* ]]; then
        print_step "Installing Essential Tools"
        run_script "$DOTFILES_DIR/scripts/install/essentials.sh" "Essential tools (Homebrew, Git, Node, etc.)"
    fi

    # Step 2: Configure git with user input
    if [[ " ${steps_to_run[*]} " == *" git "* ]]; then
        print_step "Configuring Git"
        run_script "$DOTFILES_DIR/scripts/config/git-setup.sh" "Setting up git with your name and email"
    fi

    # Step 3: Install applications
    if [[ " ${steps_to_run[*]} " == *" brew "* ]]; then
        print_step "Installing Applications"
        run_script "$DOTFILES_DIR/scripts/install/brew.sh" "Homebrew applications"
    fi

    # Step 4: Install oh-my-zsh and configure shell
    if [[ " ${steps_to_run[*]} " == *" ohmyzsh "* ]]; then
        print_step "Installing Oh My Zsh"
        run_script "$DOTFILES_DIR/scripts/config/oh-my-zsh.sh" "Oh My Zsh and shell configuration"
    fi

    # Step 5: Create symlinks for dotfiles
    if [[ " ${steps_to_run[*]} " == *" symlinks "* ]]; then
        print_step "Setting Up Configuration Files"
        run_script "$DOTFILES_DIR/scripts/config/symlinks.sh" "Creating symlinks for dotfiles"
    fi

    # Step 6: Configure applications
    if [[ " ${steps_to_run[*]} " == *" vscode "* ]]; then
        print_step "Configuring VS Code"
        run_script "$DOTFILES_DIR/scripts/config/vscode.sh" "VS Code extensions and settings"
    fi
    if [[ " ${steps_to_run[*]} " == *" chrome "* ]]; then
        run_script "$DOTFILES_DIR/scripts/config/chrome-extensions.sh" "Chrome extensions"
    fi

    # Step 7: System configuration (run last)
    if [[ " ${steps_to_run[*]} " == *" macos "* ]]; then
        print_step "Configuring macOS System Settings"
        run_script "$DOTFILES_DIR/scripts/config/macos.sh" "macOS system preferences"
    fi

    # Step 8: Installing Mac App Store apps
    if [[ " ${steps_to_run[*]} " == *" mas "* ]]; then
        print_step "Installing Mac App Store Applications"
        run_script "$DOTFILES_DIR/scripts/install/mas.sh" "Mac App Store applications"
    fi

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