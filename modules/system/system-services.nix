{
  pkgs,
  config,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  users.users."${config.mainUser}".packages = [
    pkgs.wget # downloading tool often a default in linux
    pkgs.vim # very useful text editor
    pkgs.btop # tui system monitor
    pkgs.fastfetch # up-to-date neofetch
    pkgs.borgbackup # backup system
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than-14d";
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes"];
  };

  system.stateVersion = "25.11"; # DO NOT CHANGE THIS VALUE UNLESS YOU ABSOLUTELY KNOW WHAT YOU ARE DOING
}
