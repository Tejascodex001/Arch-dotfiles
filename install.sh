#!/bin/bash
# Dotfiles install script
# Usage: ./install.sh
# Run from ~/dotfiles/

set -e
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "→ Creating directories..."
mkdir -p ~/.config/{hypr,waybar,foot,dunst,nvim,tmux}
mkdir -p ~/.local/bin
mkdir -p ~/dsa/{problems,templates,contests}
mkdir -p ~/ml/{projects,notebooks,envs}
mkdir -p ~/Pictures/{wallpapers,screenshots}

echo "→ Symlinking configs..."
ln -sf $DOTFILES/hyprland.conf      ~/.config/hypr/hyprland.conf
ln -sf $DOTFILES/hyprlock.conf      ~/.config/hypr/hyprlock.conf
ln -sf $DOTFILES/hypridle.conf      ~/.config/hypr/hypridle.conf
ln -sf $DOTFILES/waybar.config      ~/.config/waybar/config
ln -sf $DOTFILES/waybar.style.css   ~/.config/waybar/style.css
ln -sf $DOTFILES/foot.ini           ~/.config/foot/foot.ini
ln -sf $DOTFILES/dunstrc            ~/.config/dunst/dunstrc
ln -sf $DOTFILES/init.lua           ~/.config/nvim/init.lua
ln -sf $DOTFILES/tmux.conf          ~/.config/tmux/tmux.conf
ln -sf $DOTFILES/zshrc              ~/.zshrc

# Wlogout
mkdir -p ~/.config/wlogout
ln -sf $DOTFILES/wlogout/.config/wlogout/layout ~/.config/wlogout/layout
ln -sf $DOTFILES/wlogout/.config/wlogout/style.css ~/.config/wlogout/style.css

echo "→ Symlinking scripts..."
ln -sf $DOTFILES/cr         ~/.local/bin/cr
ln -sf $DOTFILES/dsa        ~/.local/bin/dsa
ln -sf $DOTFILES/powermenu  ~/.local/bin/powermenu
ln -sf $DOTFILES/accent     ~/.local/bin/accent
ln -sf $DOTFILES/screenshot ~/.local/bin/screenshot
ln -sf $DOTFILES/wallpaper  ~/.local/bin/wallpaper
ln -sf $DOTFILES/gpu-mode   ~/.local/bin/gpu-mode
ln -sf $DOTFILES/gpu-run    ~/.local/bin/gpu-run
ln -sf $DOTFILES/gpu-status ~/.local/bin/gpu-status

echo "→ Setting permissions..."
chmod +x ~/.local/bin/{cr,dsa,powermenu,accent,screenshot,wallpaper,gpu-mode,gpu-run,gpu-status}

# Dark mode
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

echo ""
echo "✓ Done. Next steps:"
echo "  1. Install packages: sudo pacman -S --needed stow hyprland foot waybar dunst fuzzel tmux neovim \
  zsh zsh-autosuggestions zsh-syntax-highlighting tlp tlp-rdw brightnessctl \
  swww hyprlock hypridle grim slurp wl-clipboard cliphist jq yazi uv pyright \
  gcc clang network-manager-applet blueman ttf-jetbrains-mono-nerd python \
  git base-devel nodejs npm swayosd wlogout playerctl"

echo "  2. AUR: paru -S obsidian discord"
echo "  3. Reload shell: exec zsh"
echo "  4. Start Hyprland"
