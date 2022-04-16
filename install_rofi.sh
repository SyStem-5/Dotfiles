#!/bin/bash

sudo pacman -Sy --noconfirm rofi

echo "Copying configuration files..."
cp -r ./rofi ~/.config/

