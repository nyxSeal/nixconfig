{ config, lib, pkgs, inputsm ... }: {

  options.rofi.enable = lib.mkEnableOption "enable rofi";

  config = lib.mkIf config.rofi.enable {
    home-manager = {
      programs.rofi.enable = true;
    };
  };

}
