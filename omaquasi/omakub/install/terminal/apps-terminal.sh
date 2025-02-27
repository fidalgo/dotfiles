#!/bin/bash

# Package list
packages="fzf ripgrep bat eza zoxide plocate btop fd-find tldr luarocks"

# Initialize variables for package manager commands
check_cmd=""
install_cmd=""
system_type=""

# Detect the Linux distribution and set appropriate commands
if [ -x "$(command -v apt)" ]; then
  system_type="Ubuntu/Debian-based"
  check_cmd="dpkg -l | grep -q \"^ii  PACKAGE \" || dpkg -l | grep -q \"^ii  PACKAGE:\""
  install_cmd="sudo apt install -y"

elif [ -x "$(command -v dnf)" ]; then
  system_type="Fedora-based"
  check_cmd="dnf list installed PACKAGE &> /dev/null"
  install_cmd="sudo dnf install -y"

elif [ -x "$(command -v pacman)" ]; then
  system_type="Arch-based"
  check_cmd="pacman -Qi PACKAGE &> /dev/null"
  install_cmd="sudo pacman -Sy --noconfirm"

elif [ -x "$(command -v zypper)" ]; then
  system_type="openSUSE-based"
  check_cmd="rpm -q PACKAGE &> /dev/null"
  install_cmd="sudo zypper install -y"

else
  echo "Unsupported Linux distribution. Please install the packages manually."
  exit 1
fi

echo "Detected $system_type system."

# Create a list of packages to install
to_install=""
for package in $packages; do
  # Replace PACKAGE placeholder with actual package name
  current_check_cmd="${check_cmd//PACKAGE/$package}"
  
  # For apt, we need to evaluate the command differently because of the OR condition
  if [[ "$system_type" == "Ubuntu/Debian-based" ]]; then
    if ! eval "$current_check_cmd"; then
      to_install="$to_install $package"
    fi
  else
    # For other package managers, we can just execute the check command
    if ! eval "$current_check_cmd"; then
      to_install="$to_install $package"
    fi
  fi
done

# Install only packages that are not already installed
if [ -n "$to_install" ]; then
  echo "Installing packages: $to_install"
  $install_cmd $to_install
else
  echo "All packages are already installed."
fi
