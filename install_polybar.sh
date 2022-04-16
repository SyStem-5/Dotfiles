#!/bin/bash

./install_fonts.sh

sudo pacman -Sy --noconfirm polybar 

echo "Copying configuration files..."
cp -r ./polybar ~/.config/

