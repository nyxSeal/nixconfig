{config, pkgs, lib, ...}: {

  options = {
    basicservices.enable = lib.mkEnableOption "enable useful but not required programs";
  };

  config = lib.mkIf config.basicservices.enable {


    documentation.dev.enable = true;
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      btop # tui system monitor
      fastfetch # up-to-date neofetch
      tealdeer # man pages but shorter
      kdePackages.dolphin 
    ];

    networking.networkmanager.enable = true; # enables network configurations interactively using nmcli or nmtui

    services.printing.enable = true; # enables CUPS printing

    programs.foot.enable = true; # terminal emulator
  };

}
