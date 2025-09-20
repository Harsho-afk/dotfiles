#!/bin/bash
rsync -av --delete \
    ~/.config/hypr \
    ~/.config/nvim \
    ~/.config/waybar \
    ~/.config/kitty \
    ~/Programms/dotfiles/

cd ~/Programms/dotfiles || exit
git add -A
git commit -m "Auto-sync dotfiles"
git push -u origin main
