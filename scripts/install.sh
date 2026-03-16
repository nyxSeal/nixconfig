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

echo -n "Generate hardware-configuration.nix into config (enter 'true' for true)? "
read -r hardwareConfigurationGeneration

if [[ "$hardwareConfigurationGeneration" == 'true' ]]; then

nixos-generate-config --no-filesystems --dir /mnt/home/$user/.nixconfig/hosts/$host
rm /mnt/home/$user/.nixconfig/hosts/$host/configuration.nix

fi

nixos-enter --root /mnt -c 'passwd ${username}'

