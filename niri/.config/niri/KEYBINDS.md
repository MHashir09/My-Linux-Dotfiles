# Niri Keybinds

My personal Niri keybindings. Press `Mod+Shift+/` in Niri to show the hotkey overlay.

## Modifier Keys
- `Mod` = Super/Windows key

## Applications

| Keybind | Action |
|---------|--------|
| `Mod + Return` | Terminal (kitty) |
| `Mod + Space` | App launcher (fuzzel) |
| `Mod + B` | Browser (Brave) |
| `Mod + E` | File manager (Nautilus) |
| `Mod + N` | Neovim (in terminal) |
| `Super + Alt + L` | Lock screen (swaylock) |

## Web Apps (Brave)

| Keybind | Action |
|---------|--------|
| `Mod + Alt + A` | Anime (HiAnime) |
| `Mod + Alt + I` | Instagram |
| `Mod + Alt + D` | Discord |
| `Mod + Alt + R` | Reddit |
| `Mod + Alt + M` | Manga (xBato) |

## Noctalia Shell

| Keybind | Action |
|---------|--------|
| `Mod + Ctrl + M` | Control center |
| `Mod + Shift + C` | Clipboard history |
| `Mod + P` | Session menu |
| `Mod + Ctrl + D` | Toggle Do not disturb |
| `Mod + Ctrl + Space` | Random wallpaper |

## Window Management

| Keybind | Action |
|---------|--------|
| `Mod + Q` | Close window |
| `Alt + H/J/K/L` | Focus window (vim keys) |
| `Alt + Ctrl + H/J/K/L` | Move window (vim keys) |
| `Alt + Home/End` | Focus first/last column |
| `Alt + Ctrl + Home/End` | Move to first/last column |
| `Mod + O` | Toggle overview |

## Window Layout

| Keybind | Action |
|---------|--------|
| `Mod + F` | Maximize column |
| `Mod + Shift + F` | Fullscreen window |
| `Mod + V` | Toggle floating |
| `Mod + Shift + V` | Switch focus floating/tiling |
| `Mod + W` | Toggle tabbed display |
| `Mod + C` | Center column |
| `Mod + Ctrl + C` | Center all columns |
| `Mod + R` | Cycle column width preset |
| `Mod + Shift + R` | Cycle window height preset |
| `Mod + Ctrl + R` | Reset window height |
| `Mod + BracketLeft/Right` | Consume/expel window |
| `Mod + Comma` | Consume window into column |
| `Mod + Period` | Expel window from column |
| `Mod + Minus/Equal` | Adjust column width (-/+10%) |
| `Mod + Shift + Minus/Equal` | Adjust window height (-/+10%) |

## Workspaces

| Keybind | Action |
|---------|--------|
| `Mod + 1-9` | Switch to workspace 1-9 |
| `Mod + Ctrl + 1-9` | Move window to workspace 1-9 |
| `Mod + U/I` | Focus workspace down/up |
| `Mod + Page_Down/Up` | Focus workspace down/up |
| `Mod + Ctrl + U/I` | Move window to workspace down/up |
| `Mod + Shift + U/I` | Move entire workspace down/up |

## Mouse Scrolling

| Keybind | Action |
|---------|--------|
| `Mod + WheelScrollDown/Up` | Focus workspace down/up |
| `Mod + Ctrl + WheelScrollDown/Up` | Move window to workspace down/up |
| `Mod + WheelScrollLeft/Right` | Focus column left/right |
| `Mod + Ctrl + WheelScrollLeft/Right` | Move column left/right |

## Screenshots and Screen-recording

| Keybind | Action |
|---------|--------|
| `Print` | Screenshot (selection) |
| `Ctrl + Print` | Screenshot screen |
| `Alt + Print` | Screenshot window |
| `Mod + S` | Screen recording (wf-recorder) |

## Media Controls

| Keybind | Action |
|---------|--------|
| `XF86AudioRaiseVolume` | Volume up (+10%) |
| `XF86AudioLowerVolume` | Volume down (-10%) |
| `XF86AudioMute` | Mute toggle |
| `XF86AudioMicMute` | Mic mute toggle |
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioStop` | Stop |
| `XF86AudioPrev` | Previous track |
| `XF86AudioNext` | Next track |

## Brightness (Laptop)

| Keybind | Action |
|---------|--------|
| `XF86MonBrightnessUp` | Brightness up (+10%) |
| `XF86MonBrightnessDown` | Brightness down (-10%) |

## System

| Keybind | Action |
|---------|--------|
| `Mod + Shift + E` | Quit Niri |
| `Ctrl + Alt + Delete` | Quit Niri |
| `Mod + Shift + P` | Power off monitors |
| `Mod + Escape` | Toggle keyboard shortcuts inhibit |
| `Super + Alt + S` | Toggle screen reader (Orca) |

## P.S

- All media key bindings work even when locked (`allow-when-locked=true`)
- Volume limited to 100% max
- Mouse wheel binds have 150ms cooldown to prevent accidental rapid scrolling
- Web app IDs are specific to your Brave profile - see config comments for how to get yours
- Customize everything in `~/.config/niri/config.kdl`
