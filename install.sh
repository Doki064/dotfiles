#!/usr/bin/env bash

### This script symlinks the dotfiles into place in the home directory.

# Install config files
for f in $(find config/* -type f); do
    if [[ ! -d $(dirname "$HOME/.$f") ]]; then
        mkdir -p "$HOME/.$(dirname $f)"
    fi
    
    if [[ -f "$HOME/.$f" ]]; then
        mv "$HOME/.$f" "$HOME/.$f.bak"
    fi
    
    ln -sf "$(readlink -f '$f')" "$HOME/.$f"
done

# Install personal zsh config
ln -sf "$(readlink -f ./zsh_files)" "$HOME/.zsh_files" && \
ln -sf "$(readlink -f ./zshrc)" "$HOME/.zshrc" && \
ln -sf "$(readlink -f ./p10k.zsh)" "$HOME/.p10k.zsh"
