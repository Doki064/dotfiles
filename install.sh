#!/usr/bin/env bash

### This script symlinks the dotfiles into place in the home directory.

# Install config files
for f in $(find config/* -type f); do
    if [[ ! -d $(dirname "$HOME/.$f") ]]; then
        mkdir -p "$HOME/.$(dirname $f)"
    fi
    
#    if [[ -f "$HOME/.$f" ]]; then
#        mv "$HOME/.$f" "$HOME/.$f.bak"
#    fi
    
    ln -svfn "$(readlink -f $f)" "$HOME/.$f"
done

# Install personal zsh config
if [[ ! -d "$HOME/.zsh" ]]; then
    mkdir "$HOME/.zsh"
fi
for f in $(find zsh/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.zsh/.$(basename $f)"
done
ln -svfn "$(readlink -f ./zshenv)" "$HOME/.zshenv"

echo " Done!"
