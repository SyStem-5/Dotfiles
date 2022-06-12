#!/bin/bash

ABSOLUTE_PATH=$(realpath .)

echo "Doom Emacs configuration setup"

echo "Installing Emacs and required tools..."
sudo pacman -Sy --noconfirm emacs git

echo "Installing Doom Emacs. This might take a while..."
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
rm -rf ~/.doom.d

read -p "Do you want to use symbolic links? [y/N] " -n 1 -r
echo    # Move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s --force $ABSOLUTE_PATH/doom_emacs ~/.doom.d
else
    cp -r $ABSOLUTE_PATH/doom_emacs ~/.doom.d
fi

