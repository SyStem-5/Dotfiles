#/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "XMonad configuration setup"

echo "Installing xmonad and required dependencies..."
sudo pacman -Sy xmonad xmonad-contrib haskell-dbus

echo "Removing old xmonad config directory..."
rm -rf ~/.xmonad

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/xmonad ~/.xmonad
else
    mkdir ~/.xmonad >> /dev/null 2>&1
    cp -r $ABSOLUTE_PATH/xmonad ~/.xmonad
fi

echo "Configuration complete"

