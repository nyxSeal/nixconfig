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
