{
  pkgs,
  config,
  lib,
  ...
}: {
  options.development.enable = lib.mkEnableOption "enables a code development suite";

  config = lib.mkIf config.development.enable {
    users.users."${config.mainUser}".packages = [
      pkgs.libgcc #c/c++ compiler
    ];
  };
}
