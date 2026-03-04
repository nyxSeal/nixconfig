{
  description = "declares all inputs and hosts via flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };

  };



  outputs = { self, nixpkgs, home-manager, ...  } @inputs: {

    nixosConfigurations = {


      nixy = nixpkgs.lib.nixosSystem {
        system =  "x86_64-linux"; 
        modules = [
          inputs.home-manager.nixosModules.home-manager
          ./hosts/main/default.nix
          ./globalvars.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };


      scout = nixpkgs.lib.nixosSystem {
        system =  "x86_64-linux";
        modules = [
          inputs.home-manager.nixosModules.home-manager
          ./hosts/backup/default.nix
          ./globalvars.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };


    }; 

  };



}
