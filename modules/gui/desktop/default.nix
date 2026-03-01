{pkgs, lib, config, ...}: {

  imports = [
    ./kde/kde.nix
    ./kde/plasma-manager-input.nix
    ./niri/niri.nix
  ];



  options = {
    gui.enable = lib.mkEnableOption "enable gui";
    gui.option = lib.mkOption "which gui to use";
  };


  gui.enable = lib.mkDefault false;




  config = lib.mkIf config.gui.enable {

    services.displayManager.ly = {
      enable = true;

      settings = {
      allow_empty_password = false;
      clear_password = true;
      };

    };
  };



  config = lib.mkIf config.gui.option "kde" {

    kde.enable = lib.mkForce true;
    plasma-manager.enable = lib.mkForce true;

  };



  config = lib.mkIf config.gui.option "niri" {

    niri.enable = lib.mkForce true;
  
  };

}
