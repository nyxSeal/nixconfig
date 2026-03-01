{
  description = "The default flake used in all configurations and calls the hosts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

  };



  outputs = { self', nixpkgs, home-manager, flake-parts, ...  } @inputs:
    flake-parts.lib.mkFlake {inherit inputs; }; {

    nixosConfigurations = {

      nixy = nixpkgs.lib.nixosSystem {
        systems = [ "x86_64-linux" ]; 
        modules = [
          ./hosts/main/configuration.nix
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

    modules = [
      ./globalVars.nix
      ./default.nix
    ];
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          home = {
            username = "${mainUser.option}";
            homeDirectory = "/home/${mainUser.option}";
            stateVersion = "25.11";
          };
          programs.home-manager.enable = true;
          #users."${mainUser}" = import ./../home-manager/home.nix;
        };
      }
    ];
  };



}
