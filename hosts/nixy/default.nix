{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/modulebundle.nix
    ./disko-config.nix
    ./../../globalvars.nix
    ./hardware-configuration.nix
  ];

  config = {
    # user info
    mainUser = "nyxSeal";
    hostName = "nixy";
    allowedSshUser = "scattergun";

    # gui-related
    entertainment.enable = lib.mkForce true;
    niri.enable = lib.mkForce true;
    noctalia.enable = lib.mkForce true;
    guiapps.enable = lib.mkForce true;
    librewolf.enable = lib.mkForce true;

    # system
    sound-driver.enable = lib.mkForce true;
    swapspace.enable = lib.mkForce true;
    zswap.enable = lib.mkForce true;
    bootloader.enum = lib.mkForce "systemd-boot";
    amd-gpu.enable = lib.mkForce true;
    bootPartition = "nvme0n1p1";
    printing.enable = lib.mkForce true;

    # other
    development.enable = lib.mkForce true;

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
