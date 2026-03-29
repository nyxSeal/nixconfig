{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    home-manager.enable = lib.mkEnableOption "enable home manager";
    noctalia.enable = lib.mkEnableOption "enable noctalia-shell";
    alacritty.enable = lib.mkEnableOption "enable alacritty";
  };

  config = lib.mkMerge [
    (lib.mkIf config.kde.enable {
      home-manager.enable = true;
      home-manager = {
        sharedModules = [inputs.plasma-manager.homeModules.plasma-manager];
        users."${config.mainUser}" = import ./gui/desktops/kde/kde-home.nix;
      };
    })

    (lib.mkIf config.alacritty.enable {
      home-manager.enable = true;
      home-manager.users."${config.mainUser}" = import ./gui/alacritty-home.nix;
    })

    (lib.mkIf config.niri.enable {
      home-manager.enable = true;
      home-manager.users."${config.mainUser}" = import ./gui/desktops/niri/niri-home.nix;
    })

    (lib.mkIf config.noctalia.enable {
      home-manager.enable = true;
      home-manager.users."${config.mainUser}".imports = [
        ./gui/noctalia/noctalia-home.nix
        inputs.noctalia.homeModules.default
      ];
    })

    (lib.mkIf config.home-manager.enable {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        users."${config.mainUser}".home = {
          username = "${config.mainUser}";
          homeDirectory = "/home/${config.mainUser}";
          stateVersion = "25.11";
        };
      };
    })
  ];
}
