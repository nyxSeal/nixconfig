{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options.waybar.enable = lib.mkEnableOption "enable waybar";

  config = lib.mkIf config.waybar.enable {
    home-manager = {
      programs.waybar = {
        enable = true;
        style = ''

        '';
      };
      #programs.waylogout.enable = true;
    };
  };
}
