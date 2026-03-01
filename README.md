# My NixOS config

This is my personal NixOS config. I don't plan on anyone else using this (though if you want to you can). 

The issues tab is what I use to keep track of things I want to add to my config.

## Installation

1. I'll figure out how to import it
2. Run the /scripts/setup.sh file using zsh


## Configuration

- Change the values in globalVars.nix to your liking
- Change or add hosts to flake.nix 

## Updating

- Run sudo nixos-rebuild switch --flake .#<host>, and replace <host> with the host you want to install (ie. sudo nixos-rebuild switch --flake .#nyxSeal

## Other

To create the ASCII titles in my configs: https://patorjk.com/software/taag/#p=display&f=Big+Money-ne


