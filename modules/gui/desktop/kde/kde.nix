{pkgs, lib, config, inputs, ...}: {

  options = {
    kde.enable = lib.mkEnableOption "enable kde plasma";
  };

  config = lib.mkIf config.kde.enable {
    services.desktopManager.plasma6.enable = true;
  };

}
