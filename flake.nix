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
        systems = [ "x86_64-linux" ]; 
        modules = [
          ./hosts/main/configuration.nix
          ./globalvars.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };


      scout = nixpkgs.lib.nixosSystem {
        systems = [ "x86_64-linux"];
        modules = [
          ./hosts/backup/configuration.nix
          ./globalvars.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };


    }; 

  };



}
