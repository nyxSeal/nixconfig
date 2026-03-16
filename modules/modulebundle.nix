{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./home-manager-setup.nix
    ./development.nix

    ./entertainment/entertainment.nix

    ./gui/applications/applications.nix
    ./gui/applications/browsers.nix
    ./gui/desktop/default.nix
    ./gui/desktop/kde/kde.nix
    ./gui/desktop/niri/niri.nix

    ./partitions/bootloader.nix
    ./partitions/swap.nix

    ./system/amd-gpu.nix
    ./system/brightness.nix
    ./system/man.nix
    ./system/networking.nix
    ./system/security.nix
    ./system/sound.nix
    ./system/system-services.nix
    ./system/zsh.nix
  ];

  config = {
    # DEFAULTS

    # ./home-manager.setup.nix:
    home-manager.enable = lib.mkDefault false;

    #./development.nix:

    #./entertainment/entertainment.nix:
    entertainment.enable = lib.mkDefault false;

    #./gui/applications/applications.nix:
    guiapps.enable = lib.mkDefault false;

    #./gui/applications/browsers.nix:
    librewolf.enable = lib.mkDefault false;
    floorp.enable = lib.mkDefault false;

    #./gui/desktop/default.nix:
    gui.enable = lib.mkDefault false;

    #./gui/desktop/kde/kde.nix:
    kde.enable = lib.mkDefault false;

    #./gui/desktop/niri/niri.nix:
    niri.enable = lib.mkDefault false;

    #./partitions/bootloader.nix:
    bootloader.enum = lib.mkDefault "null";

    #./partions/swap.nix:
    swapspace.enable = lib.mkDefault false;
    zswap.enable = lib.mkDefault false;

    #./system/amd-gpu.nix:
    amd-gpu.enable = lib.mkDefault false;

    #./system/brightness.nix
    brightness.brightnessctl.enable = lib.mkDefault false;
    brightness.ddcutil.enable = lib.mkDefault false;

    #./system/man.nix:
    man.enable = lib.mkDefault true;

    #./system/sound.nix:
    sound-driver.enable = lib.mkDefault false;
  };
}
