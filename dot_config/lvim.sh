#!/bin/env bash
export LV_BRANCH="master";
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh) --remove-backups
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/${LV_BRANCH}/utils/installer/uninstall.sh) --remove-backups

rm -rf ~/.config/lvim
rm -rf ~/.local/share/lunarvim
rm -rf ~/.cache/lvim

bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/${LV_BRANCH}/utils/installer/install.sh) --overwrite --no-install-dependencies
lvim +LvimCacheReset +q

chezmoi update --apply
lvim +PackerUpdate

