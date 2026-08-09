This is the repository containing all my Hyprland settings.
My scripts are based on my current operating system, Arch, so if something doesn't work, I'm definitely not the right person to ask for help.

Part of the documentation is currently being written, so if you find some README files, great. Otherwise, I'll be adding them shortly. (This is also the reason why some of the README files are in Italian)

## SCREENSHOTS

### Desktop

![Desktop](assets/desktop.png)

### Terminal

![Desktop](assets/terminal.png)

### Rofi

![Rofi](assets/rofi.png)

### Swaync

![Swaync](assets/swaync.png)

### Hyprlock

![Hyprlock](assets/hyprlock.png)

### Sddm

![SDDM](assets/sddm.png)


## OUTDATED PART

After switching from Fedora to Arch, this command no longer works. I would need to completely rewrite the documentation, and I'll do so when I have some time. In case anyone is interested in any of the packages, I'll leave the package list updated as of 2025 here.

Below is the command to install all the packages required to get the system working without too many issues. *(outdated)*

```bash
sudo dnf install acpid bc btop cairo-devel calcurse feh file-devel flatpak gcc-c++ grim hypridle hyprland hyprlang-devel hyprlock hyprpaper hyprutils-devel hyprwayland-scanner jq libglvnd-core-devel libglvnd-devel libjpeg-turbo-devel libjxl-devel libwebp-devel nmtui pango-devel pip3 python3 rofi sddm slurp swaylock swaync thunar virt-manager @virtualization waybar wayland-protocols-devel wayland-devel wf-recorder wlogout wlsunset

pip3 install pywal

flatpak install com.rtosta.zapzap com.spotify.Client org.telegram.desktop
```
