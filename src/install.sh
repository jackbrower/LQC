#!/bin/sh

echo "Installing LQC."

distro=$(grep -oE 'Debian|Archlinux' /etc/issue)
install="$HOME/.local/src/lqc"

if [ 'Debian' = "$distro" ]; then
  echo "Debian detected, continuing script..."
  echo "Instaling git via apt: "
  sudo apt install git
  echo "Installing x11 via apt: "
  sudo apt install xorg libxft-dev libxinerama-dev libxtst-dev libxcb-xkb-dev libx11-xcb-dev libxcb-res0-dev
elif [ 'Archlinux' = "$distro" ]; then
  echo "Arch detected, continuing script..."
  echo "Installing x11 via apt: "
  sudo pacman -Ss xorg xf86-video libxft libxinerama libxtst libxcb
else
  echo "Invalid distribution, exiting."
  exit 1
fi

echo "Freeing install directory..."
rm -rf $install
mkdir -p $install

echo "Fetching dwm, st, dmenu, slstatus..."
git clone https://github.com/jackbrower/dmenu.git $install/dmenu
git clone https://github.com/jackbrower/slstatus.git $install/slstatus
git clone https://github.com/jackbrower/dwm.git $install/dwm
git clone https://github.com/jackbrower/st.git $install/st

echo "Compiling..."
cd $install/dmenu
sudo make clean install
cd $install/slstatus
sudo make clean install
cd $install/dwm
sudo make clean install
cd $install/st
sudo make clean install

echo "Configuring .xinitrc..."
rm -f $HOME/.xinitrc
echo "dmenu &\n slstatus &\n exec dwm" > $HOME/.xinitrc

exec startx
