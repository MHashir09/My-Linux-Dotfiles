# Pochita GRUB Theme

> **This is an auto-generated README**

## Installation

1. Extract the theme to your desired location:
   ```bash
   tar -xzf Pochita.tar.gz -C ~/Mhiatic-Dotfiles/grub/themes/
   ```

   Or if you already have the extracted folder, ensure the structure is:
   ```
   ~/Mhiatic-Dotfiles/grub/themes/Pochita/
   ├── theme.txt
   ├── logo.png
   ├── background.png
   ├── font.pf2
   └── select_*.png
   ```

2. Create a symlink to the system GRUB themes directory:
   ```bash
   sudo ln -sf ~/Mhiatic-Dotfiles/grub/themes/Pochita /usr/share/grub/themes/Pochita
   ```

3. Edit `/etc/default/grub` and add the following line:
   ```bash
   GRUB_THEME="/usr/share/grub/themes/Pochita/theme.txt"
   ```

   Or simply append it using:
   ```bash
   echo 'GRUB_THEME="/usr/share/grub/themes/Pochita/theme.txt"' | sudo tee -a /etc/default/grub
   ```

4. Regenerate the GRUB configuration:
   ```bash
   sudo grub-mkconfig -o /boot/grub/grub.cfg
   ```

5. Reboot your system to see the changes:
   ```bash
   sudo reboot
   ```

## Notes

- This theme has the distro icons folder (`icons/`) removed for a cleaner look.
- The main Pochita logo (`logo.png`) is retained.
- This theme supports any resolution.

## Credits

This theme is a slightly modified version of the original [HyDE](https://github.com/HyDE-Project/HyDE) project theme.