# Dotfiles Configuration

## Overview

This repository contains personal configuration files for a Linux desktop setup centered around:

- **Hyprland**
- **Waybar**
- **Neovim**
- **Kitty**

## Prerequisites

Ensure the following packages are installed on your system:

```
hyprland
waybar  
kitty
rofi
hyprpaper
hypridle
hyprlock
neovim
brightnessctl    # Brightness control
wpctl           # Audio control (pipewire)
playerctl       # Media player control
grim            # Screenshots
slurp           # Screen area selection
wl-clipboard    # Wayland clipboard utilities
cliphist        # Clipboard history
dunst           # Notifications
nm-applet       # Network manager applet
blueman-applet  # Bluetooth manager
git
python3
nodejs
npm
cargo           # For Rust projects
gcc             # C/C++ compiler
openjdk         # Java development
rsync
```

## Installation

### Quick Setup
Clone this repository to your home directory:
```bash
git clone https://github.com/Harsho-afk/dotfiles.git ~/.config
```

Make scripts executable:
```bash
chmod +x ~/.config/hypr/scripts/*.sh
```

### Package Installation

#### Arch Linux (using yay)
```bash
yay -S hyprland waybar kitty rofi hyprpaper hypridle hyprlock \
       brightnessctl playerctl grim slurp wl-clipboard cliphist \
       dunst nm-applet blueman neovim rsync
```

#### Manual Installation
Install packages using your distribution's package manager, then follow the configuration steps.

## Configuration Details

### Hyprland
- **Dual monitor support**: Configured for laptop (eDP-1) and external display (HDMI-A-1)
- **Workspace management**: 5 workspaces per monitor
- **Keybindings**: Intuitive shortcuts for window management and applications

### Waybar
- **System monitoring**: CPU, memory, battery status
- **Media controls**: Spotify integration with playback controls
- **Audio management**: Volume and microphone controls
- **Custom modules**: Power menu, wallpaper changer, clipboard history

### Neovim
- **Modern plugin management**: Using lazy.nvim
- **LSP support**: Multiple language servers configured
- **Autocompletion**: nvim-cmp with snippet support
- **File navigation**: Telescope fuzzy finder and nvim-tree
- **Git integration**: Gitsigns and Diffview
- **Theme**: Kanagawa colorscheme

## Customization

### Wallpapers
1. Create wallpaper directory: `mkdir ~/Wallpaper`
2. Add your wallpaper images (JPG format)
3. Update `hyprpaper.conf` if needed
4. Use Super + W to cycle through wallpapers

### Themes
The configuration uses a dark theme with customizable colors. Modify the following files to change appearance:
- `waybar/theme.css` - Waybar colors
- `nvim/lua/plugins/colorscheme.lua` - Neovim theme

### Adding Applications
To add applications to the startup:
1. Edit `hypr/hyprland.conf`
2. Add entries under the `# AUTOSTART` section

## Scripts

The repository includes several utility scripts:

- `brightness.sh` - Control screen brightness
- `volume.sh` - Manage audio levels
- `wallpaper_change.sh` - Random wallpaper rotation
- `songdetail.sh` - Display current playing song
- `autosync.sh` - Sync dotfiles to git repository
   
## Acknowledgments

- All the open-source projects that make this setup possible
