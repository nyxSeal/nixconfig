{ pkgs, lib, config, ...}: {

  imports = [
    ./gui/desktop/entertainment/entertainment.nix
    ./gui/desktop/default.nix
    ./basicservices.nix
    ./essentialservices.nix
    ./home-manager-setup.nix
  ];

  entertainment.enable = lib.mkDefault false;
  gui.enable = lib.mkDefault false;
  basicservices.enable = lib.mkDefault false;
  home-manager.enable = lib.mkDefault false;
}
