#!/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "Terminal environment setup"

sudo pacman -Sy --noconfirm kitty tmux

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/kitty ~/.config/kitty
    ln -s --force $ABSOLUTE_PATH/tmux/.tmux.conf ~/.tmux.conf
else
    cp -r $ABSOLUTE_PATH/kitty ~/.config/
    cp $ABSOLUTE_PATH/tmux/.tmux.conf ~/.tmux.conf
fi

echo "Configuration complete"

