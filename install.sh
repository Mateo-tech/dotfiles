#!/bin/bash

# Check ping before doing anything else
echo "Checking internet connection..."
while ! ping -c1 google.com &>/dev/null
do
	echo "Not connected to the internet, exiting."
	exit 0
done
echo "Internet connection OK."

sudo pacman -Syu

# Install base-devel
sudo pacman -S --needed base-devel --noconfirm

# Install xinit
sudo pacman -S xorg-xinit --noconfirm

# Install base fonts
mkdir ~/.local/share/fonts -p
cd ~/.local/share/fonts
mkdir ttf/NerdNoto -p
cd ttf/NerdNoto
curl -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete.ttf --output Noto-Mono-Nerd.ttf
fc-cache
cd

# Install yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R mateo:users ./yay-git
cd yay-git
makepkg -si
cd 

sudo pacman -S stow --noconfirm
cd ~/.dotfiles

sudo pacman -S i3-gaps --noconfirm
sudo pacman -S i3lock --noconfirm
stow i3

sudo pacman -S kitty --noconfirm
stow kitty

sudo pacman -S polybar --noconfirm
3
# polybar | polybar -m | cut -d ':' -f 1

yay -S picom-ibhagwan-git

sudo pacman -S rofi --noconfirm
stow rofi

sudo pacman -S feh --noconfirm
