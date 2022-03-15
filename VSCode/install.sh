#!/usr/bin/bash

echo "Copying VSCode configuration files..."

cp ./settings.json ~/.config/Code/User/
cp ./keybindings.json ~/.config/Code/User/

echo "Done."

