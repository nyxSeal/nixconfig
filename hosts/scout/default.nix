{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/modulebundle.nix
    ./hardware-configuration.nix
    ./disko-config.nix
  ];

  config = {
    # user info
    mainUser = "scattergun";
    hostName = "scout";
    allowedSshUser = "nyxSeal";

    # system
    bootloader.enum = lib.mkForce "grub";
    diskName = lib.mkForce "sda";
    zram.enable = lib.mkForce true;
  };
}
