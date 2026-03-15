#! /bin/bash

lsblk

echo -n "Hostname: " 
read -r host


echo "Partioning disk..."
nix run github:nix-community/disko -- --mode disko ./../hosts/$host/disko-config.nix

echo "Installing NixOS..."
nixos-rebuild switch --flake ./../#$host

echo "Installation complete!"
