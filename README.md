# Mhia's Linux Dotfiles

My personal Linux configuration files managed with GNU Stow. These are the configs I use daily as of now on my Linux setup( Endeavour OS ).

## Showcase

https://github.com/user-attachments/assets/3bb6f185-2c85-457c-b1a5-d7061960975e

## Prerequisites

### Essentials

- **GNU Stow** - `sudo pacman -S stow` | [Docs](https://www.gnu.org/software/stow/)
- **Git** - `sudo pacman -S git` | [Docs](https://git-scm.com/doc)

### Shell

- **Zsh** - `sudo pacman -S zsh` | [Docs](https://www.zsh.org/)
- **Oh My Zsh** - See this for quick [setup guide](zsh/README.md) | [Docs](https://ohmyz.sh/)

### Editor

- **Neovim** - `sudo pacman -S neovim` | [Docs](https://neovim.io/doc/)
- **Config** - For more info on neovim config used, see my nvim-config's [repository](https://github.com/MHashir09/Nvim-config)

### WM / Bar / Application Launcher / Browser

- **Status Bar** - Noctalia | [Install](https://github.com/noctalia/noctalia) | [Docs](https://noctalia.github.io/)
- **Compositor** - Niri | [Install](https://yalter.github.io/niri/Getting-Started.html) | [Docs](https://yalter.github.io/niri/Configuration%3A-Introduction.html)
- **Application Launcher** - Fuzzel | `sudo pacman -S fuzzel` | [Docs](https://codeberg.org/dnkl/fuzzel)
- **Browser** - Brave | `yay -S brave-bin` | [Info](https://brave.com/)

### Fonts

- **GohuFont 14 Nerd Font** - `sudo pacman -S ttf-nerd-fonts-symbols` or `yay -S nerd-fonts-gohufont` | [Download](https://www.nerdfonts.com/)

### Utilities

- **wf-recorder** - Wayland screen recorder
  - Arch: `sudo pacman -S wf-recorder`
  - [Docs](https://github.com/ammen99/wf-recorder)

- **cliphist** - Clipboard manager for Wayland
  - Arch: `sudo pacman -S cliphist`
  - [Docs](https://github.com/sentriz/cliphist)

## Installation

1. Install prerequisites above.
2. Clone: `git clone https://github.com/yourusername/MHIAs-Dotfiles && cd MHIAs-Dotfiles`.
3. Backup existing configs, e.g: `mv ~/.zshrc ~/.zshrc.backup`.
4. Stow what you need: `stow zsh nvim noctalia niri` while in the `MHIAs-Dotfiles` directory.
- Having trouble using gnu stow ? Learn how to use it by this [awesome video by typecraft](https://youtu.be/NoFiYOqnC4o?si=9FyfJ1vny3PiNdUB).
5. ( Optional ) Remove git tracking: `cd ~/MHIAs-Dotfiles` then `rm -rf .git`.

## Customization

Adjust these for your system:
- Monitor configs in Noctalia
- Change paths and settings for your browser if you chose something other than brave in `niri/config.kdl`
- Hardcoded paths (wallpapers, scripts)
- Themes and Keybinds

See all the binds I setup for niri here: [Niri Keybinds](niri/.config/niri/KEYBINDS.md)

## The Yapping Section

*Why I made this:*

So I was previously using [omarchy](https://omarchy.org/) on arch, I didnt really had a problem with omarchy but it was kinda bloated and I wanted to configure my own setup from ground-up. A few days ago I accidently nuked my arch install( Dont ask how, it saddens me ;( ). So I installed [Endeavour OS](https://endeavouros.com/). I initially installed [i3wm](https://i3wm.org/), I configured it a bit but I didnt like it, mostly due to its dry nature if those are the correct words to describe it. Few days forward, I heard about [Niri](https://github.com/YaLTeR/niri) from a friend and I gave it a try.

First thing I noticed on niri was that their default config itself had really detailed comments explaining a ton, on top of that they have a really great documentation on the internet. It was my first time configuring a WM without excessive help of ai and relying solely on docs, so it was a great learning experience aswell. I also love this scrolling aspect of this WM. Gonna stick to it for a long time for sure.

I used [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) as a replacement for [Waybar](https://github.com/Alexays/Waybar). The reason being that uh I dont have much time to configure waybar myself as of now, I will probably do that later. Noctalia is superb, it does everything, makes your live 10x easier, has awesome support for niri and has really good documentation. I like it alot.

The setup focuses on productivity and aesthetics - because why choose when you can have both? Noctalia gives me all the info I need at a glance, Fuzzel makes it possible to launch any app in seconds, Neovim is configured for fast coding, and Zsh with Oh My Zsh makes the kitty(my terminal of choice) actually enjoyable to work in.

Feel free to use these as inspiration for your own setup. Linux is all about making the system work *your* way and having **fun**.

*Current rice status:*

Well, I plan to keep working on this setup and expand it as needed. I will probably work on this again after like 4 months because my annuals are closing in and I will project all my time in its preparation. However, I will see and consider any meaningful PR or opened issue anytime.

## Post-script

- Tested on **Endeavour OS**
- Monitor configs may be hardware-specific
- Can include bugs because..well I am just a noob and beginner to linux lol. But I tested it so I took care of every bug I could find.

## Contributing

I am open to any sort of meaningful contribution so dont shy away and contribute, I will appreciate any thoughtful effort. If you found any issue, feel free to open an issue aswell !

## License

These configs are free to use, modify, and share. Do whatever you want with them - no attribution needed (but appreciated!).

---

**If this helped you even one bit or if you like my work, feel free to star ⭐ this repo, it will be appreciated ! Happy ricing!**
