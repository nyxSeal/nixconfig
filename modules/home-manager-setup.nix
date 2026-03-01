{config, lib, pkgs, inputs, ... }: {

  options.home-manager.enable = lib.mkEnableOption "enable home manager";

  config = lib.mkIf config.home-manager.enable {

    inputs.home-manager.nixosModules.home-manager = {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        home = {
          username = "${config.mainUser}";
          homeDirectory = "/home/${config.mainUser}";
          stateVersion = "25.11";
        };
      };
    };

  };

}
