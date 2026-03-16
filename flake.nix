{
  description = "declares all inputs and hosts via flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    alejandra,
    disko,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {environment.systemPackages = [alejandra.defaultPackage.x86_64-linux];}
          disko.nixosModules.disko
          ./hosts/nixy/default.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };

      scout = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {environment.systemPackages = [alejandra.defaultPackage.x86_64-linux];}
          disko.nixosModules.disko
          ./hosts/scout/default.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
