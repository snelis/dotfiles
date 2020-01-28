# dotfiles

## Install our AUR helper
sudo pacman -Sy yay

## Update the system
yay

xrandr \
  --output USB-C-0 --primary --pos 0x0 --mode 2560x1440 --rate 165 --rotate left \
  --output DP-2 --pos 1440x440 --mode 2560x1440 --rate 165

## Apps i like
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
  bat

# Dotfiles
chezmoi init https://github.com/snelis/dotfiles
chezmoi apply
  
# Change shell to zsh
chsh -s /usr/bin/zsh
