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
sudo pacman -S --needed base-devel

# Install xinit
sudo pacman -s xorg-xinit

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

# Download dotfiles
mkdir ~/.dotfiles
cd ~/.dotfiles
git init
git remote add origin https://github.com/Mateo-tech/dotfiles
git pull origin master

sudo pacman -S stow

stow i3

sudo pacman -S kitty
stow kitty

sudo pacman -S polybar
polybar | polybar -m | cut -d ':' -f 1

yay -S picom-ibhagwan-git

sudo pacman -S rofi
stow rofi

sudo pacman -S feh

# Run stow linkining
stow picom
stow polybar
stow rofi
stow vim
stow kitty
stow i3
