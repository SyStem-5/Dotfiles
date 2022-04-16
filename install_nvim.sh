#!/bin/bash

sudo pacman -Sy neovim

cp -r ./nvim ~/.config/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "MAKE SURE TO RUN :PlugInstall inside of neovim on first launch."

