#!/bin/bash

# Package list
packages="fzf ripgrep bat eza zoxide plocate btop fd-find tldr luarocks"

# Detect the Linux distribution and package manager
if [ -x "$(command -v apt)" ]; then
  echo "Detected Ubuntu/Debian-based system. Installing packages with apt..."
  sudo apt install -y $packages

elif [ -x "$(command -v dnf)" ]; then
  echo "Detected Fedora-based system. Installing packages with dnf..."
  sudo dnf install -y $packages

elif [ -x "$(command -v pacman)" ]; then
  echo "Detected Arch-based system. Installing packages with pacman..."
  sudo pacman -Sy --noconfirm $packages

elif [ -x "$(command -v zypper)" ]; then
  echo "Detected openSUSE-based system. Installing packages with zypper..."
  sudo zypper install -y $packages

else
  echo "Unsupported Linux distribution. Please install the packages manually."
  exit 1
fi
