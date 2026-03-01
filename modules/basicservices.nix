{config, pkgs, ...}: {

  description = "bunch of services that aren't required for the system but are pretty useful";

  options = {
    basicservices.enable = lib.mkEnableOption "enable kde plasma";
  };

  config = lib.mkIf config.basicservices.enable {


    documentation.dev.enable = true;
    nixpkgs.config.allowUnfree = true;

    environment.systemPackges = with pkgs; [
      btop # tui system monitor
      fastfetch # up-to-date neofetch
      tealdeer # man pages but shorter
    ];

    networking.networkmanager.enable = true; # enables network configurations interactively using nmcli or nmtui

    services.printing.enable = true; # enables CUPS printing
  };

}
