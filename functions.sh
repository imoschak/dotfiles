#!/bin/zsh

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

link_backup_if_present() {
   typeset -r src="$1"
   typeset -r tgt="$2"

   if [[ -f $tgt ]]; then
      echo "Backing up $tgt to ${tgt}.bak"
      mv $tgt ${tgt}.bak
   fi

   echo "Linking $src to $tgt"
   ln -s "$src" "$tgt"
}
 
