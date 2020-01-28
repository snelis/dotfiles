# dotfiles

## Install our AUR helper
```sudo pacman -Sy yay```

## Update the system
```yay```

## Configure the monitors
```
xrandr \
  --output USB-C-0 --primary --pos 0x0 --mode 2560x1440 --rate 165 --rotate left \
  --output DP-2 --pos 1440x440 --mode 2560x1440 --rate 165
```

## Apps i like
```
yay -S \
  rofi \
  spotify \
  chromium \
  imagewriter \
  mate-terminal \
  gnome-terminal \
  chezmoi \
  zsh \
  antigen \
  neovim \
  neovim-plug \
  tmux \
  bat \
  python-pip \
  the_silver_searcher \
  xclip \
  autojump \
  gnome-keyring \
  seahorse \
  playerctl \
  xorg-xbacklight \
  xorg-xwininfo
```

## Dotfiles
```
chezmoi init https://github.com/snelis/dotfiles
chezmoi apply
```

## Install vim plugins
```
nvim +PlugInstall +qall
nvim +UpdateRemote +qall
```
  
## Change shell to zsh
```
chsh -s /usr/bin/zsh
```

## Add files back to chezmoi when changed
```
chezmoi add ~/.config/nvim/init.vim
chezmoi add ~/.config/mimeapps.list
chezmoi add ~/.config/i3/config
chezmoi add ~/.config/i3/status.conf
chezmoi add ~/.config/nvim/init.vim
chezmoi add ~/.config/wal/sequences
chezmoi add ~/.profile
chezmoi add ~/.tmux.conf
chezmoi add ~/.zshrc
```
