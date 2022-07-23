#!/bin/zsh

cd "$(dirname "$0")"
export DOTFILES="$(pwd -P)"

. "${DOTFILES}/functions.sh"

# Check for required utilities
check_for_commands git wget curl screen tmux

# Install all submodules
for install_file in $(find "${DOTFILES}"/*/ -name install.sh); do
    "$install_file"
done
