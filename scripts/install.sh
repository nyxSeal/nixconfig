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


git clone https://github.com/nyxSeal/nixconfig --branch untested /mnt/home/nyxSeal

mv /mnt/home/nyxSeal/nixconfig /mnt/home/nyxSeal/.nixconfig

echo "Installing NixOS..."
nixos-install --flake /mnt/home/nyxSeeal/.nixconfig#$host

echo "NixOS installation complete!"
