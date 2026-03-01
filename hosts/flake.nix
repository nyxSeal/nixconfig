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



  outputs = { self, nixpkgs, home-manager, vars, ...  } @inputs: let
    homeManagerOption = 
  "home-manager.nixosModules.home-manager = 
  
  ";
  
  in  {

    nixosConfigurations = {

      nixy = nixpkgs.lib.nixosSystem {
        systems = [ "x86_64-linux" ]; 
        modules = [
          ./main/configuration.nix
          #./globalVars.nix
        ];
      };
      scout = nixpkgs.lib.nixosSystem {
        systems = [ "x86_64-linux"];
        modules = [
          ./backup/configuration.nix
          #./globalVars.nix
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
          username = "${vars.mainUser}";
          homeDirectory = "/home/${vars.mainUser}";
          stateVersion = "25.11";
        };
        programs.home-manager.enable = true;
      };
    };
  };



}
