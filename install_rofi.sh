#!/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "Rofi configuration setup"

echo "Installing rofi..."
sudo pacman -Sy --noconfirm rofi

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/rofi ~/.config/rofi
else
    cp -r $ABSOLUTE_PATH/rofi ~/.config/
fi

echo "Configuration complete"

