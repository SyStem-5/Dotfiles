#!/bin/bash

sudo pacman -Sy --noconfirm kitty tmux

echo "Copying configuration files..."
cp -r ./kitty ~/.config/
cp ./tmux/.tmux.conf ~/.tmux.conf

