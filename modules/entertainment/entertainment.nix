{pkgs, lib, config, inputs, vars, ...}: {


  options = {
    entertainment.enable = lib.mkEnableOption "entertainment, such as games and communication";
  };

  config = lib.mkIf config.entertainment.enable {

    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
     extraSpecialArgs = { inherit inputs; };
     users."${vars.mainUser}" = import ./entertainment-home.nix
    };

    programs.steam = {
      enable = true;
      #remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      #localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    
    environment.systemPackages = with pkgs; [

      prismlauncher
      vesktop
    ];

  };

}
