{ pkgs, lib, config, ...}: {

  imports = [
    ./entertainment/entertainment.nix
    ./gui/desktop/default.nix
    ./gui/desktop/kde/kde.nix
    ./gui/desktop/niri/niri.nix
    ./basicservices.nix
    ./essentialservices.nix
    ./home-manager-setup.nix
  ];

  entertainment.enable = lib.mkDefault false;
  gui.enable = lib.mkDefault false;
  basicservices.enable = lib.mkDefault false;
  home-manager.enable = lib.mkDefault false;




  options.gui.option = lib.mkOption "which gui to use";


  config = lib.mkIf config.gui.option "kde" {
    kde.enable = true;
  };

  config = lib.mkIf config.gui.option "niri" {
    niri.enable = true;
  };
}
