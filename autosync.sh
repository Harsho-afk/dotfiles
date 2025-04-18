#!/bin/bash
cp -ru ~/.config/hypr ~/.config/nvim ~/.config/waybar ~/Programms/dotfiles
cd ~/Programms/dotfiles
git add .
git commit -m "Auto-sync dotfiles"
git push -u origin main
