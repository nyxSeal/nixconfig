{ pkgs, lib, config, ...}: {

  imports = [
    ./entertainment/entertainment.nix
    ./gui/applications/applications.nix
    ./gui/applications/browsers.nix
    ./gui/desktop/default.nix
    ./gui/desktop/kde/kde.nix
    ./gui/desktop/niri/niri.nix
    ./home-manager-setup.nix
    ./essentials/zsh.nix
    ./essentials/system-services.nix
    ./essentials/sound.nix
    ./essentials/partitions.nix
    ./essentials/development.nix
    ./essentials/amd-gpu.nix
    ./essentials/man.nix
    ./essentials/networking.nix
    ./essentials/security.nix
    
  ];

  config.entertainment.enable = lib.mkDefault false;
  config.guiapps.enable = lib.mkDefault false;
  config.librewolf.enable = lib.mkDefault false;
  config.floorp.enable = lib.mkDefault false;
  config.gui.enable = lib.mkDefault false;
  config.home-manager.enable = lib.mkDefault false;
  config.kde.enable = lib.mkDefault false;
  config.niri.enable = lib.mkDefault false;
  config.sound-driver.enable = lib.mkDefault false;
  config.swapspace.enable = lib.mkDefault false;
  config.zswap.enable = lib.mkDefault false;
  config.systemd-boot.enable = lib.mkDefault false;
  config.amd-gpu.enable = lib.mkDefault false;

  config.zsh.enable = lib.mkDefault true;
  config.man.enable = lib.mkDefault true;

}
