Tony Khaov's dotfiles.

TODO:

- [ ] add shell confirmation/indication messages
- [ ] use if to have clean scripts
- [ ] automate macOS settings using shell

# Installation

1. Signin with App store GUI first!

1. Open your terminal and run these command lines:

```
cd ~/Downloads/dotfiles-main && chmod u+x ./install.sh && ./install.sh
```

---

I highly recommend you to not run ./install.sh as installation is synchronous.
If you want to save time you can run shell scripts inside install.sh
individually. Make sure you complete running ./setup.sh first. For alfred and
chrome extensions, make sure

2. Terminal:

- Open Terminal.app > Preferences > Import > Dracula.terminal
- Select Dracula theme > Set as default > Change font to JetBrains Mono

3. Settings

- Keyboards

  - Key Repeat: Fast
  - Delay Until Repeat: Short
  - Modifier Keys > Caps Lock: Escape
  - Fn touch > Show emoji and symbols
  - Text > Correct spelling automatically: False
  - Disable Spotlight shortcut > Shortcuts > Spotlight
  - Shortcuts > Screenshots > Copy picture of X to the clipboard: Cmd + Shift +
    3

- Trackpad

  - Silent clicking: Checked
  - Tap to click: Checked
  - Tracking speed: Fast
  - Scroll direction: Natural: Unchecked
  - Accessibility > Mouse & Trackpad > Trackpad Options > "Enable dragging: with
    three finger drag": Checked

- Finder

  - Show view options > Text size: 14
  - Show view options > Icon size: 1/2
  - Show view options > Sort By: Name
  - View > Show Path Bar
  - View > Show Status Bar
  - Preferences > New Finder window show: "/tonykhaov"
  - Preferences > Advanced > Show all filename extensions: Checked

- Notes

  - Preferences > Default text size: 4/5

- Security
  - Require password: Immediately
  - Firewall: Turn on
