{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    brightness.brightnessctl.enable = lib.mkEnableOption "enables brightnessctl manager for internal displays";

    brightness.ddcutil.enable = lib.mkEnableOption "enables ddcutil manager for external displays";
  };

  config = lib.mkMerge [
    (lib.mkIf config.brightness.brightnessctl.enable {
      services.ddccontrol = {
        enable = true;
        package = pkgs.ddcutil;
      };
    })

    (lib.mkIf config.brightness.ddcutil.enable {
      users.users."${config.mainUser}".packages = [pkgs.brightnessctl];
    })
  ];
}
