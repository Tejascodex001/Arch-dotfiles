#!/bin/bash
# Sync all configs to dotfiles repo
# Usage: sync [commit message]

DOTFILES="$HOME/dotfiles"
MSG="${1:-sync configs}"

echo "→ Syncing configs..."

# Hyprland
cp ~/.config/hypr/hyprland.conf   $DOTFILES/hypr/.config/hypr/hyprland.conf
cp ~/.config/hypr/hyprlock.conf   $DOTFILES/hypr/.config/hypr/hyprlock.conf
cp ~/.config/hypr/hypridle.conf   $DOTFILES/hypr/.config/hypr/hypridle.conf

# Waybar
cp ~/.config/waybar/config        $DOTFILES/waybar/.config/waybar/config
cp ~/.config/waybar/style.css     $DOTFILES/waybar/.config/waybar/style.css

# Foot
cp ~/.config/foot/foot.ini        $DOTFILES/foot/.config/foot/foot.ini

# Dunst
cp ~/.config/dunst/dunstrc        $DOTFILES/dunst/.config/dunst/dunstrc

# Neovim
cp ~/.config/nvim/init.lua        $DOTFILES/nvim/.config/nvim/init.lua

# Tmux
cp ~/.config/tmux/tmux.conf       $DOTFILES/tmux/.config/tmux/tmux.conf

# Zsh
cp ~/.zshrc                       $DOTFILES/zsh/.zshrc

# Wlogout
cp ~/.config/wlogout/layout       $DOTFILES/wlogout/.config/wlogout/layout
cp ~/.config/wlogout/style.css    $DOTFILES/wlogout/.config/wlogout/style.css

# Scripts
cp ~/.local/bin/cr                $DOTFILES/scripts/.local/bin/cr
cp ~/.local/bin/dsa               $DOTFILES/scripts/.local/bin/dsa
cp ~/.local/bin/powermenu         $DOTFILES/scripts/.local/bin/powermenu
cp ~/.local/bin/accent            $DOTFILES/scripts/.local/bin/accent
cp ~/.local/bin/screenshot        $DOTFILES/scripts/.local/bin/screenshot
cp ~/.local/bin/wallpaper         $DOTFILES/scripts/.local/bin/wallpaper
cp ~/.local/bin/gpu-mode          $DOTFILES/scripts/.local/bin/gpu-mode
cp ~/.local/bin/gpu-run           $DOTFILES/scripts/.local/bin/gpu-run
cp ~/.local/bin/gpu-status        $DOTFILES/scripts/.local/bin/gpu-status

echo "→ Committing..."
cd $DOTFILES
git add -A
git commit -m "$MSG"
git push

echo "✓ Done — $MSG"
