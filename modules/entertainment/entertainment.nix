{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    entertainment.enable = lib.mkEnableOption "entertainment, such as games and communication";
  };

  config = lib.mkIf config.entertainment.enable {
    home-manager.enable = lib.mkOverride 500 true;

    programs.steam = {
      enable = true;
      #remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      #localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };

    users.users."${config.mainUser}".packages = [
      pkgs.prismlauncher
      pkgs.vesktop
    ];
  };
}
