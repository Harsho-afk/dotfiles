# Hyprland and nvim Configuration

This repository contains my personal configuration files for my Linux setup, centered around the Hyprland.

## Installation

### Prerequisites
- Hyprland
- Waybar
- Kitty (terminal)
- Rofi (application launcher)
- Hyprpaper
- Hypridle
- Hyprlock
- Nvim
- Required utilities: brightnessctl, wpctl, playerctl, etc.

### Setup
1. Clone this repository to your home directory:
```
git clone https://github.com/Harsho-afk/dotfiles.git ~/.config
```

2. Make sure all scripts are executable:
```
chmod +x ~/.config/hypr/scripts/*.sh
```

3. Install required dependencies:
```
# For Arch-based distributions
yay -S hyprland waybar kitty rofi hyprpaper hypridle hyprlock brightnessctl playerctl grim slurp wl-clipboard cliphist
```

### Changing Wallpaper
Place your wallpapers in the `~/Wallpaper` directory and update `hyprpaper.conf` accordingly.
