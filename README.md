# dotfiles

Productivity-first Arch Linux setup for Hyprland.

## Stack
- WM: Hyprland
- Terminal: foot
- Shell: zsh
- Editor: Neovim
- Multiplexer: tmux
- Launcher: fuzzel
- Bar: waybar
- Notifications: dunst
- Lock: hyprlock + hypridle
- Power: TLP

## Accent colors
Switch accent with `accent [blue|green|red|purple]` or click the waybar icon.

## DSA workflow
Type `dsa` to open a tmux session with Neovim + compile pane.
Use `cr file.cpp` to compile and run.

## Deploy
```
git clone https://github.com/Tejascodex001/Arch-dotfiles.git

cd dotfiles

./install.sh
```
## KEYBIND REFERENCE
```
Super+Return    Terminal
Super+Space     Launcher
Super+B         Firefox
Super+P         Power menu
Super+L         Lock screen
Super+N         Toggle notifications
Super+V         Clipboard history
Super+F         Fullscreen
Super+Q         Kill window
Print           Screenshot
Shift+Print     Screenshot region
1-5             Switch workspace
Shift+1-5       Move window to workspace
H/J/K/L         Focus movement
```

