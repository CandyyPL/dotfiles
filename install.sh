#!/bin/bash

# Install all those things
sudo pacman -Syu bspwm sxhkd polybar alacritty neovim zsh ttf-cascadia-code picom

# Apply config
mv config/bspwm $HOME/.config/
mv config/sxhkd $HOME/.config/
mv config/polybar $HOME/.config/
mv config/alacritty $HOME/.config/
mv config/nvim $HOME/.config/
mv config/.zshrc $HOME/
mv img/arch.jpeg $HOME/wallpaper.jpeg

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Enable zsh
echo "zsh" >> $HOME/.bashrc

