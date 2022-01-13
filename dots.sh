#!/bin/bash

# This is a script to clone and deply my dotfiles

git clone https://github.com/Ocillacubes/junpog-dots
cp -r junpog-dots/.config/* ~/.config/
cp junpog-dots/.Xresources ~/
cp junpog-dots/.xinitrc ~/
cp junpog-dots/.zshrc ~/
cp -r junpog-dots/.local/scripts ~/.local/
