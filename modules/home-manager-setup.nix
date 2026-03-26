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
  };

  config = lib.mkIf config.home-manager.enable (
    lib.mkMerge [
      (lib.mkIf config.kde.enable {
        home-manager = {
          sharedModules = [inputs.plasma-manager.homeModules.plasma-manager];
          users."${config.mainUser}" = import ./gui/desktop/kde/kde-config-home.nix;
        };
      })

      (lib.mkIf config.entertainment.enable {
        home-manager.users."${config.mainUser}" = import ./gui/applications/alacritty.nix;
      })

      (lib.mkIf config.niri.enable {
        home-manager.users."${config.mainUser}" = import ./gui/desktop/niri/niri-config-home.nix;
      })

      (lib.mkIf config.noctalia.enable {
        home-manager.users."${config.mainUser}".imports = [
          ./gui/desktop/noctalia/noctalia-home.nix
          inputs.noctalia.homeModules.default
        ];
      })

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          users."${config.mainUser}".home = {
            username = "${config.mainUser}";
            homeDirectory = "/home/${config.mainUser}";
            stateVersion = "25.11";
          };
        };
      }
    ]
  );
}
