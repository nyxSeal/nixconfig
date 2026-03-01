{
  description = "The default flake used in all configurations and calls the hosts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };



  outputs = { self, nixpkgs, home-manager, config, ...  } @inputs: {

    imports = [ ./globalvars.nix ];

    nixosConfigurations = {

      nixy = nixpkgs.lib.nixosSystem {
        systems = [ "x86_64-linux" ]; 
        modules = [
          ./hosts/main/configuration.nix
          ./hosts/main/default-flake.nix
        ];
      };
      scout = nixpkgs.lib.nixosSystem {
        systems = [ "x86_64-linux"];
        modules = [
          ./hosts/backup/configuration.nix
        ];
      };

    };
 

    specialArgs = { 
      inherit inputs;
    };

    home-manager.nixosModules.home-manager =
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        home = {
          username = "${config.mainUser}";
          homeDirectory = "/home/${config.mainUser}";
          stateVersion = "25.11";
        };
        programs.home-manager.enable = true;
      };
    };
  };



}
