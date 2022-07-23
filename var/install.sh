#!/bin/zsh

this_dir="$(dirname "$0")"
. "${DOTFILES}/functions.sh"

link_backup_if_present_unlink_if_symlink_unless_same "${this_dir}/screenrc" "$HOME/.screenrc"
link_backup_if_present_unlink_if_symlink_unless_same "${this_dir}/tmux.conf" "$HOME/.tmux.conf"
