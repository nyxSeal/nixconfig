{ config, lib, pkgs, ... }: {

  options.printing.enable = lib.mkEnableOption "enable printing";

  config = lib.mkIf config.printing.enable {
    services.printing.enable = true;
    services.avahi.enable = true;
    services.avahi.nssmdns4 = true;
  };

}
