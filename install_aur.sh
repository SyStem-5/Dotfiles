#!/bin/bash

sudo pacman -Sy --noconfirm git base-devel

echo "Cloning yay AUR helper..."
git clone https://aur.archlinux.org/yay-git.git

cd yay-git

echo "Building package..."
makepkg -si

