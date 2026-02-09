# My Waybar Dotfiles

Custom Waybar configuration for Niri with Gruvbox theming. Part of [MHashir09/My-Linux-Dotfiles](https://github.com/MHashir09/My-Linux-Dotfiles).

## Preview

![Preview](https://github.com/user-attachments/assets/6bcd8b30-4091-4b3e-830d-ae37b19ddf84)

## Requirements

Note: I will be using `Fedora` so installation will be for fedora but you can refer to the [official installation guide](https://github.com/Alexays/Waybar#installation) to find instructions for your own distribution.

### Core Dependencies
```bash
sudo dnf install waybar
```
### Optional Dependencies
```bash
# For additional modules
sudo dnf install pulseaudio pavucontrol  # Audio control
sudo dnf install NetworkManager          # Network module
sudo dnf install bluez bluez-tools       # Bluetooth
```
### Fonts
```bash
# Enable COPR repository for Nerd Fonts
sudo dnf copr enable atim/nerd-fonts

# Install JetBrainsMono Nerd Font
sudo dnf install nerd-fonts-jetbrains-mono
```
**Alternative font installation if not on fedora:**
```bash
# Download manually from nerdfonts.com
mkdir ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

## Features

-  Gruvbox Dark color scheme
-  System monitoring (CPU, Memory, Disk)
-  PulseAudio integration
-  Network status
-  Battery indicator (for laptops)
-  System tray
-  Niri workspace integration
-  Date and time
-  Custom styling

## Installation

### Quick Install

```bash
# Clone this repository
git clone https://github.com/MHashir09/My-Linux-Dotfiles/tree/main/waybar/.config/waybar ~/.config/waybar

# Start Waybar
waybar
```
### Using with Main Dotfiles

If installing as part of the main dotfiles setup:

```bash
# This is handled automatically by the main installation guide
# See: https://github.com/MHashir09/My-Linux-dotfiles
```

## Configuration

### File Structure

```
~/.config/waybar/
├── config               # Main configuration
├── modules.json         # Modules configuration
├── colors.css           # colors
├── style.css            # Styling
├── scripts/             # Custom scripts
│   ├── main-menu.sh
│   ├── rofi-wifi-menu.sh
│   └── ...
└── README.md            # This file
```
### Modules Included

- **Workspaces** - Niri workspace indicator
- **Clock** - Date and time
- **CPU** - CPU usage
- **Memory** - RAM usage
- **Network** - Connection status
- **PulseAudio** - Volume control
- **Battery** - Battery status (if available)
- **Tray** - System tray icons
- **Custom modules** - Various custom scripts

## Customization

To learn more about waybar customization read: [Official Wiki](https://github.com/Alexays/Waybar/wiki).

### Modify config

Refer to official [configuration guide](https://github.com/Alexays/Waybar/wiki/Configuration).

Edit `~/.config/waybar/config`

### Modify modules

Refer to official [modules guide](https://github.com/Alexays/Waybar/wiki/Module:-Custom).

Edit `~/.config/waybar/modules.json`

### Change Colors

Refer to your favorite color palette's site for colors. 

Edit `~/.config/waybar/colors.css`

### Change styling

Refer to official [styling guide](https://github.com/Alexays/Waybar/wiki/Styling).

Edit `~/.config/waybar/style.css`

### Add Custom Scripts

To learn about shell scripting, refer to this [beginner-friendly guide](https://www.learnshell.org/).

1. Create script in `~/.config/waybar/scripts/`
2. Make executable: `chmod +x script-name.sh`
3. Add to `modules.json` or refer it wherever you wanna use it

## Integration with Niri

### Auto-start Waybar

Note: Not needed if you are using my niri config

Add to `~/.config/niri/config.kdl`:

```json
spawn-at-startup {
    "waybar"
}
```

### Disable Unused Modules

Comment out modules you don't need in `config` and `modules.json`.

## Credits

- Based on Waybar: https://github.com/Alexays/Waybar
- Gruvbox colors: https://github.com/morhetz/gruvbox
- Part of My-Linux-Dotfiles ( MHIA ): https://github.com/MHashir09/My-Linux-Dotfiles

## Contributing

Issues and pull requests are welcome! Please ensure your contributions:
- Follow Gruvbox color scheme
- Are compatible with Niri
- Work on Fedora (and mention if Fedora-specific)
- Include documentation for new features

## License

Free to use and modify. No attribution required but appreciated!