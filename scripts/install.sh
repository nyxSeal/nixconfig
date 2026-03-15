#! /bin/bash

set -e

lsblk



echo -n "Hostname: " 
read -r host

echo -n "Username: "
read -r username

echo -n "Branch of this repo to merge: "
read -r branch

cd

echo "Partioning disk..."
nix run github:nix-community/disko --extra-experimental-features "nix-command flakes" -- --mode disko ~/nixconfig/hosts/$host/disko-config.nix



echo "Installing NixOS..."
nixos-install --flake ~/nixconfig#$host

echo "NixOS installation complete!"



nixos-enter

cd /home/$username

git clone https://github.com/nyxSeal/nixconfig --branch $branch

mv nixconfig .nixconfig

nixos-rebuild boot --flake ./.nixconfig#$host

passwd nyxSeal

echo "Total installation complete!"
echo



echo -n "Restart (y/n)? "
read -r restartOrNot

if [[ "$restartOrNot" == 'y' ]]; then
  exit
  reboot
fi
