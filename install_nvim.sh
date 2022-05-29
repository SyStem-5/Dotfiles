#!/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "Neovim configuration setup"

echo "Installing neovim and required tools..."
sudo pacman -Sy --noconfirm neovim curl xclip

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/nvim ~/.config/nvim
else
    cp -r $ABSOLUTE_PATH/nvim ~/.config/
fi

# Installing the neovim plugin manager - https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "MAKE SURE TO RUN :PlugInstall inside of neovim on first launch."
echo "Configuration complete"

