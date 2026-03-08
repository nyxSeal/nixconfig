{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    kde.enable = lib.mkEnableOption "enable kde plasma";
  };

  config = lib.mkIf config.kde.enable {
    home-manager.enable = lib.mkOverride 500 true;
    gui.enable = lib.mkOverride 500 true;
    brightness.ddcutil.enable = lib.mkOverride 500 true;

    services.desktopManager.plasma6.enable = true;
    users.users."${config.mainUser}".packages = [pkgs.kdePackages.ksshaskpass];
    environment.variables.SSH_ASKPASS_REQUIRE = "prefer";
  };
}
