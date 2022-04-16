#!/bin/bash

echo "Copying configuration files..."
cp -r ./omf ~/.config/

echo "Installing oh-my-fish"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

