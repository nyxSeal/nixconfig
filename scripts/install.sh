#! /bin/bash

set -e

lsblk



echo -n "Hostname: " 
read -r host

echo -n "Username: "
read -r username

echo -n "Branch of this repo to use: "
read -r branch

cd

echo "Partioning disk..."
nix run github:nix-community/disko --extra-experimental-features "nix-command flakes" -- --mode disko ~/nixconfig/hosts/$host/disko-config.nix



echo "Installing NixOS..."
nixos-install --flake github:nyxSeal/nixconfig#$host

git clone https://github.com/nyxSeal/nixconfig --branch untested /mnt/home/nyxSeal/.nixconfig
