# dotfiles

This is based on manjaro i3.

## Install our AUR helper and update the system
```
sudo pacman-mirrors --country Netherlands
sudo pacman -Syuu yay
```

## Keyserver
```
echo "keyserver hkp://pool.sks-keyservers.net" > /home/$USER/.gnupg/gpg.conf
```

## Datetime
```
sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc 0
```

## Apps i like, mind the `--noconfirm`
```
yay --noconfirm -S iptables-nft
```

```
yay --noconfirm -S \
    iptables-nft \
    rofi \
    spotify \
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
    ripgrep
```

```
pyenv install 3.10.5
pyenv global 3.10.5
```

## py3status modules
```
pip install \
    pydbus \
    tzlocal \
    pytz \
    black \
    isort \
    jedi \
    PyGObject \
    dbus-python


```
## Global pip packages

```bash
pip install \
    isort \
    black \
    ipython \
    pip-tools \
    kafka-python \
    ipdb \
    jedi \
    requests \
    cffi \
    certifi \
    tzlocal \
    py3status \
    pydbus \
    pygobject \
    dbus-python
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
newgroup docker
docker version
```

## kernel options for my Dell XPS 9560
```
pcie_port_pm=off acpi_rev_override=1 acpi_osi=Linux acpi_osi=! "acpi_osi=Windows 2009" modprobe.blacklist=nouveau,nvidia nouveau.modeset=0 acpi_backlight=none intel_iommu=on iommu=pt overlay.metacopy=N
```

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
