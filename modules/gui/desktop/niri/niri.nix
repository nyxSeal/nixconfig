{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    niri.enable = lib.mkEnableOption "enable niri";
  };

  config = lib.mkIf config.niri.enable {
    gui.enable = lib.mkOverride 500 true;
    brightness.ddcutil.enable = lib.mkOverride 500 true;

    programs.niri.enable = true;
  };
}
