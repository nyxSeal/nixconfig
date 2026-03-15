#! /bin/bash

set -e

lsblk

echo -n "Hostname: " 
read -r host

cd

echo "Partioning disk..."
nix run github:nix-community/disko --extra-experimental-features "nix-command flakes" -- --mode disko ~/nixconfig/hosts/$host/disko-config.nix

echo "Installing NixOS..."
nixos-install --flake ~/nixconfig#$host

echo "Installation complete!"
