#!/bin/sh

echo "Installing LQC."

# Replace MINT with DEBIAN
distro=$(grep -oE 'Mint|Archlinux' /etc/issue)
install="$HOME/.local/src/jackbrower"

if [ 'Mint' = "$distro" ]; then
  echo "Debian detected, continuing script..."
  echo "Instaling git from distro package manager: "
  sudo apt install git
  echo "Fetching dwm, st, dmenu, slstatus..."
  rm -rf $distro
  mkdir -p $install
  git clone https://github.com/jackbrower/dmenu.git $install/dmenu
elif [ 'Archlinux' = "$distro" ]; then
  echo "Arch detected, continuing script..."
else
  echo "Invalid distribution, exiting."
  exit 1
fi
