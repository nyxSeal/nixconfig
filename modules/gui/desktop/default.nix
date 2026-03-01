{pkgs, lib, config, ...}: {


  options = {
    gui.enable = lib.mkEnableOption "enable gui";
  };


  config = lib.mkIf config.gui.enable {

    services.displayManager.ly = {
      enable = true;

      settings = {
      allow_empty_password = false;
      clear_password = true;
      };

    };
  };


}
