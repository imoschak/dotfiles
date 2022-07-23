#!/bin/zsh

this_dir="$(dirname "$0")"
. "${DOTFILES}/functions.sh"

if [[ ! -f "$HOME/.local/bin/lvim" ]]; then
    echo "Installing lvim"
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
else
    echo "lvim already installed, skipping"
fi

link_backup_if_present_unlink_if_symlink_unless_same "$this_dir/config.lua" "$HOME/.config/lvim/config.lua"
