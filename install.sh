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
    
    ln -sfn "$(readlink -f $f)" "$HOME/.$f"
done

# Install personal zsh config
ln -sfn "$(readlink -f ./zsh_files)" "$HOME/.zsh_files" && \
ln -sfn "$(readlink -f ./zshrc)" "$HOME/.zshrc" && \
ln -sfn "$(readlink -f ./p10k.zsh)" "$HOME/.p10k.zsh"
