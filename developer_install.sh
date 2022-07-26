#!/bin/bash
sudo pacman -Syu

# Install basic applications
sudo pacman -Sy curl firefox openssh openvpn neovim
sudo pacman -Sy xorg-server
sudo pacman -Sy xorg-xinit xmonad xmobar
sudo pacman -Sy dmenu alacritty picom feh lightdm
sudo pacman -Sy nodejs npm

# Oh-My-Zsh
sudo pacman -Sy zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $HOME/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install configurations (dotfiles)
echo ".cfg" >> $HOME/.gitignore
git clone --bare --recursive https://github.com/flohansen/dotfiles $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -f
git --git-dir=$HOME/.cfg/ --work-tree=$HOME submodule update --init --recursive
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
