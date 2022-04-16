#/bin/bash

sudo pacman -Sy xmonad xmonad-contrib haskell-dbus

echo "Copying configuration files..."
cp -r ./xmonad ~/.config/

