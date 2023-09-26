#!/bin/bash
echo 'Enter ngrok authentication token'
echo '-----------------------------------'
read -p "Token:" authtoken
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm *
yay -S ngrok --noconfirm
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl restart sshd.service
ngrok authtoken $authtoken
ngrok tcp 22
