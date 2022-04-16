#!/usr/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "VSCode configuration setup"

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/settings.json ~/.config/Code/User/settings.json
    ln -s --force $ABSOLUTE_PATH/keybindings.json ~/.config/Code/User/keybindings.json
else
    cp $ABSOLUTE_PATH/settings.json ~/.config/Code/User/
    cp $ABSOLUTE_PATH/keybindings.json ~/.config/Code/User/
fi

echo "Configuration complete"
