#! /bin/bash

set -e

lsblk



echo -n "Hostname: " 
read -r host

echo -n "Username: "
read -r username

echo -n "Branch of this repo to use: "
read -r branch

echo -n "Generate hardware-configuration.nix into config (y/n)? "
read -r hardwareConfigurationGeneration

cd

echo "Partioning disk..."
nix run github:nix-community/disko --extra-experimental-features "nix-command flakes" -- --mode disko ~/nixconfig/hosts/$host/disko-config.nix



if [[ "$hardwareConfigurationGeneration" == 'y' ]]; then
  echo
  echo "Generating hardware-configuration.nix"
  nixos-generate-config --no-filesystems --root --dir mnt/home/$user/.nixconfig/hosts/$host
  rm /mnt/home/$user/.nixconfig/hosts/$host/configuration.nix
fi


echo
echo "Installing NixOS..."
nixos-install --flake github:nyxSeal/nixconfig#$host

echo
echo "Cloning configuration repo into home directory..."
git clone https://github.com/nyxSeal/nixconfig --branch untested /mnt/home/nyxSeal/.nixconfig

echo
echo "Create your password for ${username}: "
nixos-enter --root /mnt -c 'passwd ${username}'

