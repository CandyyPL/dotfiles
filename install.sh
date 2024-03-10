#!/bin/bash

# Arch installation
# sudo pacman -Syu bspwm sxhkd polybar alacritty zsh feh picom

# Debian install
# sudo apt install bspwm sxhkd polybar alacritty zsh feh picom

# Make directories
mkdir ~./config
mkdir ~./config/bspwm
mkdir ~./config/sxhkd
mkdir ~./config/polybar
mkdir ~./config/alacritty
mkdir ~./config/nvim

# Apply config
cp config/bspwm $HOME/.config/
cp config/sxhkd $HOME/.config/
cp config/polybar $HOME/.config/
cp config/alacritty $HOME/.config/
cp config/nvim $HOME/.config/

mv $HOME/.zshrc $HOME/.zshrc_old
cp config/zsh/.zshrc $HOME/

# Enable zsh
# echo "zsh" >> $HOME/.bashrc

