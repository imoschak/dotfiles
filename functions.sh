#!/bin/zsh

check_for_commands() {
    for com in "$@"; do
        if ! command -v "$1" >/dev/null 2>&1; then
            echo "Error: '$1' is not installed"
            exit 1
        fi
    done
}

install_via_git_if_not_present() {
    typeset -r name="$1"
    typeset -r url="$2"
    typeset -r target="$3"

    if [[ ! -d "$target" ]]; then
        echo "Installing $name"
        git clone $url $target
    else
        echo "$target already exists"
    fi
}

link_backup_if_present_unlink_if_symlink() {
    typeset -r src="$1"
    typeset -r tgt="$2"

    if [[ -f "$tgt" ]]; then
        echo "Backing up $tgt to ${tgt}.bak"
        mv "$tgt" "${tgt}.bak"
    fi

    if [[ -h "$tgt" ]]; then
        echo "Target $tgt is a symlink removing"
        rm "$tgt"
    fi

    echo "Symlinking $src to $tgt"
    ln -s "$src" "$tgt"
}
