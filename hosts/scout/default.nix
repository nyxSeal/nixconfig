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
    ./../../globalvars.nix
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

    # user declaration
    users.users."${config.mainUser}" = {
      isNormalUser = true;
      extraGroups = ["wheel" "git" "networkmanager"];

      packages = [
        pkgs.tree
      ];
    };
  };
}
