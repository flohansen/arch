#!/bin/bash
pacman -Syu

# Install basic applications
pacman -S \
    curl firefox openssh openvpn neovim zsh \
    xorg-server xorg-xinit xmonad xmobar dmenu \
    alacritty picom feh lightdm

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install configurations (dotfiles)
echo ".cfg" >> $HOME/.gitignore
git clone --bare https://github.com/flohansen/dotfiles $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no