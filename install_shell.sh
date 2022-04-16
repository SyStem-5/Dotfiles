#!/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "Fish shell configuration setup"

sudo pacman -Sy --noconfirm fish

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/omf ~/.config/omf
else
    cp -r $ABSOLUTE_PATH/omf ~/.config/
fi

echo "Installing oh-my-fish"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo "Configuration complete"


