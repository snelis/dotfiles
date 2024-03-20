# dotfiles

This is based on manjaro i3.

## Install our AUR helper and update the system
```
sudo pacman-mirrors --country Netherlands
sudo pacman -Syuu yay
```

## Keyserver
```
echo "keyserver keyserver.ubuntu.com" > /home/$USER/.gnupg/gpg.conf
echo "keyserver keyserver.ubuntu.com" >> /etc/pacman.d/gnupg/gpg.conf
```

## Datetime
```
sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 0
```

## Apps i like, mind the `--noconfirm`
```
yay -Rs --noconfirm palemoon-bin
yay -S iptables-nft
```


```
yay --noconfirm -Sy \
    rofi \
    mate-terminal \
    gnome-terminal \
    chezmoi \
    zsh \
    antigen \
    neovim \
    neovim-plug \
    tmux \
    bat \
    numlockx \
    python-pip \
    gobject-introspection \
    the_silver_searcher \
    xclip \
    autojump \
    gnome-keyring \
    seahorse \
    playerctl \
    xorg-xbacklight \
    xorg-xwininfo \
    signal-desktop \
    autorandr \
    discord \
    mate-utils \
    docker \
    docker-compose \
    pyenv \
    pyenv-virtualenv \
    postgresql-libs \
    py3status \
    gnu-netcat \
    neofetch \
    woeusb \
    ctags \
    direnv \
    ebtables \
    qemu \
    virt-manager \
    stern-bin \
    evolution \
    github-cli \
    kubectl \
    npm \
    starship \
    ripgrep \
    google-chrome \ 
    firefox-developer-edition \
    1password \
    light-locker \
    noto-fonts-emoji \
    xss-lock \
    cargo \
    luarocks \
    ruby \
    composer \
    javac \
    julia \
    powerline \
    bob-bin \
    filelight \
    dolphin \
    breeze-icons
```

```
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
```
```
pyenv install 3.10.5
pyenv global 3.10.5
```

## Global pip packages

```bash
pip install \
    PyGObject \
    black \
    certifi \
    cffi \
    dbus-python \
    ipdb \
    ipython \
    isort \
    jedi \
    kafka-python \
    pip-tools \
    py3status \
    pydbus \
    pygobject \
    pynvim \
    neovim \
    pytz \
    requests \
    tzlocal 
```



## Configure the monitors
```
xrandr \
  --output USB-C-0 --pos 0x0 --mode 2560x1440 --rate 165 --rotate left \
  --output DP-2 --pos 1440x440 --mode 2560x1440 --rate 165 --primary \
  && autorandr -s default
```

## Dotfiles
```
chezmoi init https://github.com/snelis/dotfiles
chezmoi apply
```

## Install vim plugins
```
pip3 install --user pynvim
nvim +PlugInstall +qall
nvim +UpdateRemote +qall
```

## Change to pulse audio
```
install_pulse
```

## Docker

```
systemctl enable --now docker.service
sudo usermod -a -G docker $USER
newgrp docker
docker version
```

## kernel options for my Dell XPS 9560
```
pcie_port_pm=off acpi_rev_override=1 acpi_osi=Linux acpi_osi=! "acpi_osi=Windows 2009" modprobe.blacklist=nouveau,nvidia nouveau.modeset=0 acpi_backlight=none intel_iommu=on iommu=pt overlay.metacopy=N
```

## Dell XPS 9320 audio fix /etc/modprobe.d/i915.conf
```
options i915 enable_guc=3
```

## /etc/mkinitcpio.conf
```
MODULES=(snd_soc_rt715_sdca snd_soc_rt1316_sdw snd_sof_pci_intel_tgl snd_hda_intel snd_soc_sof_sdw i915)
FILES=(/crypto_keyfile.bin /lib/firmware/intel/sof/sof-adl.ri /lib/firmware/intel/sof-tplg/sof-adl-rt1316-l12-rt714-l0.tplg)
```
Then do a sudo `mkinitcpio -P`

## Change shell to zsh
```
chsh -s /usr/bin/zsh
reboot
```

## Add files back to chezmoi when changed
```
chezmoi add ~/.config/nvim/init.vim
chezmoi add ~/.config/mimeapps.list
chezmoi add ~/.config/i3/config
chezmoi add ~/.config/i3/status.conf
chezmoi add ~/.config/nvim/init.vim
chezmoi add ~/.config/wal/sequences
chezmoi add ~/.config/dunst/dunstrc
chezmoi add ~/.config/compton.conf
chezmoi add ~/.profile
chezmoi add ~/.tmux.conf
chezmoi add ~/.zshrc
```
