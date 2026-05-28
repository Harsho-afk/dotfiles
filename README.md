# Dotfiles Configuration

## Overview

This repository contains personal configuration files for a Linux desktop setup centered around:

- **Hyprland** (with Lua-based config)
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
wpctl            # Audio control (pipewire)
playerctl        # Media player control
grim             # Screenshots
slurp            # Screen area selection
wl-clipboard     # Wayland clipboard utilities
cliphist         # Clipboard history
dunst            # Notifications
nm-applet        # Network manager applet
blueman-applet   # Bluetooth manager
wlogout          # Logout menu
pavucontrol      # Audio control GUI
tailscale        # VPN (systray)
mcontrolcenter   # System controller
jq               # JSON parsing (used in scripts)
wtype            # Wayland keyboard input (clipboard paste)
git
python3
python3-gi       # GObject introspection (for mediaplayer.py)
nodejs
npm
cargo            # For Rust projects
gcc              # C/C++ compiler
openjdk          # Java development
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
chmod +x ~/.config/scripts/*.sh
```

Create the wallpaper directory:

```bash
mkdir -p ~/Pictures/Wallpaper
mkdir -p ~/Pictures/Screenshots
```

### Package Installation

#### Arch Linux (using yay)

```bash
yay -S hyprland waybar kitty rofi hyprpaper hypridle hyprlock \
       brightnessctl playerctl grim slurp wl-clipboard cliphist \
       dunst nm-applet blueman neovim rsync wlogout pavucontrol \
       wtype jq python-gobject
```

## Configuration Details

### Hyprland

The Hyprland config is written entirely in **Lua** using the `hl` API, split across multiple files:

- `hyprland.lua` — Entry point, loads all modules
- `general.lua` — Monitor setup, window decoration, animations, gestures
- `keybinds.lua` — All keybindings
- `rules.lua` — Window, layer, and workspace rules
- `autostart.lua` — Startup applications
- `variables.lua` — Global variables (terminal, browser, etc.)
- `env.lua` — Environment variables (GPU, cursor, Qt theme)

**Hardware:**
- Dual GPU: Intel iGPU + NVIDIA (`AQ_DRM_DEVICES`)
- Dual monitors: laptop `eDP-1` (1920×1080@144Hz) at position `1920,0` and external `HDMI-A-1` (1920×1080@100Hz) at `0,0`

**Workspace layout:**
- Workspaces 1–5 → `eDP-1`
- Workspaces 11–15 → `HDMI-A-1`
- `SUPER + 0-9` to switch workspaces on the laptop screen
- `ALT + 0-9` to switch workspaces on the external monitor

**Notable settings:**
- Caps Lock remapped to Escape (`caps:swapescape`)
- 3-finger horizontal/vertical gestures for workspace switching
- Transparency toggle via `SUPER + Z`
- Blur and shadows disabled for performance

### Keybindings

| Key | Action |
|-----|--------|
| `SUPER + Q` | Open terminal (kitty) |
| `SUPER + E` | Open file manager (thunar) |
| `SUPER + S` | App launcher (rofi) |
| `SUPER + F` | Open browser (firefox) |
| `SUPER + B` | Bluetooth manager |
| `SUPER + CTRL + S` | Open Spotify |
| `SUPER + W` | Change wallpaper |
| `SUPER + D` | Clipboard history (cliphist + rofi) |
| `SUPER + Z` | Toggle window transparency |
| `SUPER + C` / `ALT + F4` | Close window |
| `SUPER + V` | Toggle floating |
| `SUPER + CTRL + F` | Toggle fullscreen |
| `SUPER + A` | Toggle maximized |
| `ALT + TAB` | Cycle windows |
| `CTRL + ALT + L` | Lock screen (hyprlock) |
| `SUPER + CTRL + L` | Exit Hyprland |
| `SUPER + CTRL + N` | Shutdown |
| `SUPER + CTRL + R` | Reboot |
| `Print` | Area screenshot |
| `SHIFT + Print` | Fullscreen screenshot |
| `CTRL + Print` | Active window screenshot |
| Media keys | Volume, brightness, playback control |

### Waybar

Top bar with pill-shaped module groups. Modules from left to right:

**Left:** CPU usage, memory usage, workspace switcher

**Center:** Active window title

**Right:** Backlight, Spotify playback, volume (speaker + mic), privacy indicators, system tray, battery, idle inhibitor, clock/calendar, wallpaper changer, clipboard history, power menu

**Theme** (`theme.css`): Pure black background (`#000000`) with white foreground. Transparent bar background. Hover highlight inverts to white background with black text.

Custom Spotify module uses `mediaplayer.py` (Python/Playerctl) with play/pause on click and next/prev on scroll.

### Hyprlock

Lock screen displays:
- Blurred wallpaper (`~/Wallpaper/wallpaper_1.png`)
- Large clock (HH:MM)
- Date (Day, DD Month)
- Username greeting
- Currently playing song via `songdetail.sh`
- Centered password input field

Font: SF Pro Display Bold

### Hypridle

| Timeout | Action |
|---------|--------|
| 5 min | Dim brightness to 10% |
| 10 min | Lock screen |
| On sleep | Lock session |
| On wake | Restore display |

### Neovim

Plugin manager: **lazy.nvim**

**Plugins:**

| Category | Plugins |
|----------|---------|
| LSP | nvim-lspconfig, mason.nvim, mason-lspconfig |
| Completion | nvim-cmp, LuaSnip, cmp-nvim-lsp, cmp-buffer, cmp-path, friendly-snippets |
| Formatting | conform.nvim (black, prettier, shfmt) |
| File tree | nvim-tree |
| Fuzzy finder | telescope.nvim |
| Git | gitsigns.nvim, diffview.nvim |
| UI | bufferline.nvim, lualine.nvim, indent-blankline.nvim |
| Theme | kanagawa.nvim |
| Extras | nvim-autopairs, Comment.nvim, nvim-colorizer, markview.nvim, which-key.nvim, typr |

**LSP servers (auto-installed via Mason):**
`lua_ls`, `pylsp`, `rust_analyzer`, `clangd`, `jdtls`, `ts_ls`, `cssls`, `html`, `djlsp`, `gopls`

**Key mappings (leader = Space):**

| Key | Action |
|-----|--------|
| `<C-n>` | Toggle file tree |
| `<Tab>` / `<S-Tab>` | Next/prev buffer |
| `<leader>b` | Close current buffer |
| `<leader>ff/fg/fb/fh` | Telescope find/grep/buffers/help |
| `<leader>go/gc/gh/gr` | Diffview open/close/history/refresh |
| `<leader>fm` | Format file |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>m` | Toggle markview preview |
| `<leader>s` | Toggle split markdown view |
| `<leader>n` | Toggle relative line numbers |
| `gd/gD/gi/gr` | LSP go-to definition/declaration/implementation/references |
| `K` | Hover docs |
| `<C-s>` | Save file |
| `<C-p>` | Sync lazy plugins |

### Kitty

Minimal config with font size keybindings:

| Key | Action |
|-----|--------|
| `CTRL + +` / `CTRL + Numpad+` | Increase font size |
| `CTRL + -` / `CTRL + Numpad-` | Decrease font size |

## Scripts

Located in `~/.config/scripts/`:

| Script | Description |
|--------|-------------|
| `brightness.sh` | Control screen brightness via `brightnessctl` with dunst notifications. Flags: `--get`, `--inc`, `--dec`, `--toggle` |
| `volume.sh` | Manage speaker and microphone volume via `wpctl`. Flags: `--get`, `--inc`, `--dec`, `--toggle`, `--mic-*` |
| `wallpaper_change.sh` | Randomly cycle wallpapers from `~/Pictures/Wallpaper/*.jpg` with history tracking (30% of total kept in `/tmp/.wallpaper_history`) |
| `songdetail.sh` | Output currently playing track (artist — title) with play/pause icon for use in hyprlock |
| `mediaplayer.py` | Waybar custom module: streams Spotify playback state as JSON using Python/GObject Playerctl bindings |
| `screenshot.sh` | Take screenshots with `grim`/`slurp`, save to `~/Pictures/Screenshots/`, copy to clipboard, notify via dunst. Modes: `area`, `full`, `window` |
| `logoutlaunch.sh` | Launch `wlogout` with scaled layout based on monitor resolution and wall color detection |
| `autosync.sh` | Rsync configs to `~/Programms/dotfiles/` and auto-commit + push to git |

## Auto-sync

The `autosync.sh` script syncs the following directories to `~/Programms/dotfiles/`:

```
~/.config/hypr
~/.config/nvim
~/.config/waybar
~/.config/kitty
~/.config/scripts
```

Run it manually or add to a cron job / systemd timer.

## Customization

### Wallpapers

1. Add JPG images to `~/Pictures/Wallpaper/`
2. Update `hypr/hyprlock.conf` `path` for the lock screen wallpaper
3. Use `SUPER + W` or the Waybar wallpaper button to cycle

### Colors / Theme

- `waybar/theme.css` — Waybar colors (currently pure black/white)
- `nvim/lua/plugins/colorscheme.lua` — Neovim theme (currently Kanagawa)
- `waybar/style.css` — Waybar layout and pill shape styling

### Monitors

Edit `hypr/general.lua` to change monitor names, resolutions, refresh rates, or positions.

### Autostart Applications

Edit `hypr/autostart.lua` to add or remove startup applications.

## Acknowledgments

All the open-source projects that make this setup possible.
