Tony Khaov's dotfiles.

# Installation

1. Sign in with App store GUI first!

2. Open your terminal and run this script: (to clone the repo and start the
   setup)

```
mkdir -p ~/Documents/Coding && git clone https://github.com/tonykhaov/dotfiles.git ~/Documents/Coding/dotfiles && cd ~/Documents/Coding/dotfiles && chmod +x ./install.sh && ./install.sh
```

---

3. Set up alfred with preferences

- Alfred Preferences > Advanced > Set preferences folder > dotfiles/alfred

4. Terminal:

- Open Terminal.app > Preferences > Import > Dracula.terminal
- Select Dracula theme > Set as default > Change font to JetBrains Mono and 18
  for font size

5. General Settings

- Keyboards

  - Modifier Keys > Caps Lock: Escape
  - Fn touch > Show emoji and symbols
  - Disable Spotlight shortcut > Shortcuts > Spotlight
  - Shortcuts > Screenshots > Copy picture of X to the clipboard: Cmd + Shift +
    3

- Trackpad

  - Silent clicking: Checked
  - Tracking speed: Fast

- Finder

  - Show view options > Text size: 14
  - Show view options > Icon size: 1/2
  - Show view options > Sort By: Name

- Notes

  - Preferences > Default text size: 4/5

- Security
  - Firewall: Turn on

6. Import browser bookmarks

- brave://bookmarks/ > Import bookmarks

7. Imports OneTab urls

- chrome-extension://chphlpgkkbolifaimnlloiipkdnihall/import-export.html

8. Install Anki add-ons

- Advanced Browser: **874215009**
- Fastbarwith nightmode support **46611790**
- Large and Colorful Buttons **1829090218**
- Review Heatmap

9. Things 3

- Disabled Quick Entry shortcut

10. 1Password

- Keyboard Shortcuts > Remove Fill Login or Show 1Password shortcut

# Before reseting your Macbook

You need to export these things:

1. Browser bookmarks

- chrome://bookmarks/ > Export bookmarks

2. OneTab

- chrome-extension://chphlpgkkbolifaimnlloiipkdnihall/import-export.html > copy
  export urls > save them in Apple Notes
