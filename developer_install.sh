#!/bin/bash
sudo pacman -Syu

# Install yay package mananger
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si

# Install basic applications
sudo pacman -Sy curl firefox openssh openvpn neovim
sudo pacman -Sy xorg-server xorg-xinit xorg-xset
sudo pacman -Sy xmonad xmonad-contrib xmobar
sudo pacman -Sy dmenu alacritty picom feh lightdm lightdm-webkit2-greeter
sudo pacman -Sy nodejs npm
yay -Sy nerd-fonts-jetbrains-mono

# Enable LightDM
sudo systemctl enable lightdm.service
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf

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
