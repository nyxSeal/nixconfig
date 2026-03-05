{pkgs, config, lib, ...}: {

  options = {
    librewolf.enable = lib.mkEnableOption "enables librewolf browser";
    floorp.enable = lib.mkEnableOption "enables floorp browser";
  };

  config = lib.mkMerge [

    (lib.mkIf config.librewolf.enable {
      users.users."${config.mainUser}".packages = [ pkgs.librewolf ];
    })


    (lib.mkIf config.floorp.enable {
      users.users."${config.mainUser}".packages = [ pkgs.floorp-bin ];
    })

  ];

}
