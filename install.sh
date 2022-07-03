#!/bin/zsh

cd "$(dirname "$0")"
DOTFILES="$(pwd -P)"
ZSH_CUSTOM="/home/${USER}/.oh-my-zsh/custom"

. "${DOTFILES}/functions.sh"

# TODO: Add check for dependencies

# Step 1: Install oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
   echo "Installing oh-my-zsh"
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

install_via_git_if_not_present "zsh-syntax-highlighting" https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" 
install_via_git_if_not_present "zsh-autosuggestions" https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" 
install_via_git_if_not_present "zsh-pure-theme" https://github.com/sindresorhus/pure.git "${ZSH_CUSTOM}/themes/pure"

link_backup_if_present "$DOTFILES/zshrc" "$HOME/.zshrc"
