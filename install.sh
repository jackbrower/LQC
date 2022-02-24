#!/bin/sh

echo "Installing LQC."

content=$(cat /etc/issue)
if [ "Debian" == "$distro"* ]; then
  echo "Debian detected, continuing script..."
elif [ "Archlinux" == *"$distro"* ]; then
  echo "Arch detected, continuing script..."
else
  echo "Invalid distribution, exiting."
  exit 1
fi
