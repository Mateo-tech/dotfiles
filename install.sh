#!/bin/bash

## ARCH INSTALLATION ON NON-UEFI SYSTEMS ##
# fdisk -l
# fdisk /dev/sda
# d
# n <Enters>
# w
# mkfs.ext4 /dev/sda1
# iwctl
# device list
# station wlan0 scan
# station wlan0 get-networks
# station wlan0 connect <Name>
# pacman -Syy
# pacman -S reflector
# reflector  -c "CZ" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
# mount /dev/sda1 /mnt
# pacstrap /mnt base linux linux-firmware vim
# genfstab -U /mnt >> /mnt/etc/fstab
# arch-chroot /mnt
# timedatectl set-timezone Europe/Prague
# vim /etc/locale.gen ==> Enable
# locale-gen
# echo LANG=en_GB.UTF-8 > /etc/locale.conf
# export LANG=en_GB.UTF-8
# echo arch > /etc/hostname
# vim /etc/hosts
# 	127.0.0.1	localhost
# 	::1		localhost
# 	127.0.1.1	arch 
# passwd ==> root
# pacman -S grub
# grub-install /dev/sda
# grub-mkconfig -o /boot/grub/grub.cfg
# pacman -S sudo
# useradd -m <Username>
# passwd <Username>
# usermod -aG wheel,audio,video,storage <Username>
# EDITOR=vim visudo ==> Uncomment %wheel ALL(ALL:ALL) ALL
# pacman -S xorg networkmanager
# systemctl enable NetworkManager.service

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
stow polybar

yay -S picom-ibhagwan-git
stow picom

sudo pacman -S rofi --noconfirm
stow rofi

stow vim

sudo pacman -S feh --noconfirm

sudo pacman -S firefox --noconfirm

sudo pacman -S bluez --noconfirm
sudo pacman -S bluez-utils --noconfirm

sudo pacman -S pipewire pipewire-pulse
