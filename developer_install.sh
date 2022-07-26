#!/bin/bash
sudo pacman -Syu

# Install basic applications
sudo pacman -S curl firefox openssh openvpn neovim xorg-server xorg-xinit xmonad xmobar dmenu alacritty picom feh lightdm

# Oh-My-Zsh
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $HOME/.zshrc

# Install configurations (dotfiles)
echo ".cfg" >> $HOME/.gitignore
git clone --bare https://github.com/flohansen/dotfiles $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
