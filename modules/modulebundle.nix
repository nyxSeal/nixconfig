{ pkgs, lib, config, ...}: {

  imports = [
    ./gui/desktop/entertainment/entertainment.nix
    ./gui/desktop/default.nix
    ./basicservices.nix
    ./essentialservices.nix
  ];

  entertainment.enable = lib.mkDefault false;
  gui.enable = lib.mkDefault false;
  basicservices.enable = lib.mkDefault false;

}
