Tony Khaov's dotfiles.

# Installation

1. Sign in with App store GUI first!

2. Open your terminal and run this script: (to clone the repo and start the
   setup)

```
git clone git@github.com:tonykhaov/dotfiles.git ~/Downloads/dotfiles && cd ~/Downloads/dotfiles && chmod +x ./install.sh && ./install.sh
```

---

3. Terminal:

- Open Terminal.app > Preferences > Import > Dracula.terminal
- Select Dracula theme > Set as default > Change font to JetBrains Mono

4. Settings

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

5. Import browser bookmarks

- brave://bookmarks/ > Import bookmarks

# Before reseting your Macbook

You need to export these things:

1. Browser bookmarks

- brave://bookmarks/ > Export bookmarks

2. OneTab

- chrome-extension://chphlpgkkbolifaimnlloiipkdnihall/import-export.html > copy
  export urls > save them in Apple Notes

3. Files inside ~/Documents

- Run this script to export files inside ~/Documents

```
echo "Where do you want to export your files?"
ls /Volumes
read hardDrive
echo "Copying files from ~/Documents to /Volumes/$hardDrive"
cp -a ~/Documents/. /Volumes/$hardDrive/Documents
```
