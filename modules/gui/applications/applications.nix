{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    guiapps.enable = lib.mkEnableOption "enables a suite of gui applications";
  };

  config = lib.mkIf config.guiapps.enable {

    users.users."${config.mainUser}".packages = [
      pkgs.kdePackages.dolphin
      pkgs.gimp # image editor
      pkgs.libreoffice-qt-fresh # open source microslop 365 office suite alternative
      pkgs.omnissa-horizon-client # virtual desktop client
      pkgs.vorta # gui for borgbackup
      pkgs.alacritty # terminal emulator
      pkgs.kdePackages.ark # archive manager
      pkgs.kdePackages.spectacle # screenshot tool
    ];
  };
}
