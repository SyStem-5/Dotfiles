#!/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "KiCAD configuration setup"

echo "Installing KiCAD and required dependencies..."
sudo pacman -Syu --noconfirm kicad
sudo pacman -Syu --noconfirm --asdeps kicad-library kicad-library-3d

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/kicad ~/.config/kicad
else
    cp -r $ABSOLUTE_PATH/kicad ~/.config/
fi

echo "Configuration complete"

