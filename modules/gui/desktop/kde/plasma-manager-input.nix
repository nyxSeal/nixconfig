{


    description = "Plasma manager flake";

    inputs = {

      plasma-manager = {
        url = "github:nix-community/plasma-manager";
        inputs.nixpkgs.follows "nixpkgs";
        inputs.home-manager.follows = "nixpkgs";
      };

    };



    outputs = {pkgs, inputs, config, lib, ... }: {

      options = {
        plasma-manager.enable = lib.mkEnableOption "enable plasma-manager";
      };

      config = lib.mkIf config.plasma-manager.enable {


        modules = [

          home-manager.nixosModules.home-manager = 
          {
            home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
            users."${config.mainUser}" = import ./kde-config-home.nix;
          };

        ];



      };


    };
}
