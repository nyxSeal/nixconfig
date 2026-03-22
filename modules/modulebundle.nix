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
    ./system/printing.nix
    ./system/security.nix
    ./system/sound.nix
    ./system/system-services.nix
    ./system/zsh.nix
  ];
  options = {
    mainUser = lib.mkOption {
      type = lib.types.str;
      description = "the primary user of the current host";
    };

    hostName = lib.mkOption {
      type = lib.types.str;
      description = "the name of the host";
    };

    gitUsername = lib.mkOption {
      type = lib.types.str;
      default = "nyxSeal";
      description = "the username of the git user";
    };

    gitEmail = lib.mkOption {
      type = lib.types.str;
      default = "litigate_putdown.zigzagged008@slmails.com";
      description = "the email of the git user";
    };

    allowedSshUser = lib.mkOption {
      type = lib.types.str;
      description = "the user allowed to SSH into the host";
    };

    diskName = lib.mkOption {
      type = lib.types.str;
      description = "the name of the disk partition (excluding /dev)";
    };
  };

  config = {
    # DEFAULTS

    # ./home-manager.setup.nix:
    home-manager.enable = lib.mkDefault false;
    noctalia.enable = lib.mkDefault false;

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
    zswap.enable = lib.mkDefault false;
    zram.enable = lib.mkDefault false;

    #./system/amd-gpu.nix:
    amd-gpu.enable = lib.mkDefault false;

    #./system/brightness.nix
    brightness.brightnessctl.enable = lib.mkDefault false;
    brightness.ddcutil.enable = lib.mkDefault false;

    #./system/man.nix:
    man.enable = lib.mkDefault true;

    #./system/printing.nix:
    printing.enable = lib.mkDefault false;

    #./system/sound.nix:
    sound-driver.enable = lib.mkDefault false;
  };
}
