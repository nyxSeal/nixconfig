{
  pkgs,
  config,
  lib,
  ...
}: {
  options.man.enable = lib.mkEnableOption "enables extra documentation";

  config = lib.mkIf config.man.enable {
    documentation.dev.enable = true;
    users.users."${config.mainUser}".packages = [
      pkgs.tealdeer
      /*
      shortened man pages
      */
    ];
  };
}
