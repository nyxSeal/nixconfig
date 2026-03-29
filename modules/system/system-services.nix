{
  pkgs,
  config,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  users.users."${config.mainUser}" = {
    isNormalUser = true;
    extraGroups = ["wheel" "git" "networkmanager"];
    packages = [
      pkgs.wget # downloading tool often a default in linux
      pkgs.vim # very useful text editor
      pkgs.btop # tui system monitor
      pkgs.fastfetch # up-to-date neofetch
      pkgs.borgbackup # backup system
      pkgs.tree # file system hierarchy viewer
    ];
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      jetbrains-mono
    ];
    enableDefaultPackages = true;
  };

  hardware.firmware = [pkgs.linux-firmware];
  hardware.enableAllFirmware = true; # includes unfree blobs

  hardware.bluetooth.enable = true;

  # power management
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # use latest kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # clear old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than-14d";
  };

  nix.settings = {
    auto-optimise-store = true; # remove unlinked/unused files
    experimental-features = ["nix-command" "flakes"]; # enables flakes (and nix-command but flakes requires nix-command)
  };

  system.stateVersion = "25.11"; # DO NOT CHANGE THIS VALUE UNLESS YOU ABSOLUTELY KNOW WHAT YOU ARE DOING
}
