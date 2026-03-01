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

  config.entertainment.enable = lib.mkDefault false;
  config.gui.enable = lib.mkDefault false;
  config.basicservices.enable = lib.mkDefault false;
  config.home-manager.enable = lib.mkDefault false;
  config.kde.enable = lib.mkDefault false;
  config.niri.enable = lib.mkDefault false;




  #options.gui.option = lib.mkOption {
  #  type = lib.type.enum ["kde" "niri" ];
  #  description = "which gui to use";
  #};

  #config.lib.mkMerge = [
  #  (lib.mkIf (config.gui.option == "kde") {
  #    kde.enable = true;
  #  })

  #  (lib.mkIf (config.gui.option == "niri") {
  #    niri.enable = true;
  #  })
  #];

}
