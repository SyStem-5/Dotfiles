#!/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "Polybar configuration setup"

./install_fonts.sh

echo "Installing polybar..."
yay -Sy polybar

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/polybar ~/.config/polybar
else
    cp -r $ABSOLUTE_PATH/polybar ~/.config/
fi

echo "Configuration complete"

