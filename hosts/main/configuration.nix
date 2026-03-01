
{ config, lib, pkgs, inputs,  ... }: {


  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./defaults.nix
      inputs.home-manager.nixosModules.home-manager
    ];



  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    borgbackup # backup system
    #floorp-bin # alternative browser for sites that need features blocked by librewolf
    gimp # image editor
    home-manager # declaratively manage home directory
    kdePackages.ksshaskpass # kde ssh agent 
    kdePackages.filelight # file usage visualizer
    libgcc # c/c++ compiler
    libreoffice-qt-fresh # open source Microsoft 365 office suite alternative
    librewolf  # hardened firefox (gecko) based browser
    neovim # better vim text editor
    omnissa-horizon-client # virtual desktop client
    #rocmPackages.rocm-smi # shows gpu information for AMD GPUs # edit, does not work (still need a solution)
    vorta # gui for borgbackup
  ];



  boot = {
     
    loader = {
       systemd-boot.enable = true;
       efi.canTouchEfiVariables = true;
       timeout = 10; # extends the amount of time the generation table on boot is shown
     };
     
     kernelParams = [
       "zswap.enabled=1" # enables zswap
       "zswap.compressor=lz4" # compression algorithm
       "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
       "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
     ];
     
     initrd.systemd.enable = true; # required if using lz4 algorithm for zswap     
     kernelPackages = pkgs.linuxPackages_latest; # use latest kernel
  };



  services.swapspace = {
    enable = true; # dynamically creates swap when needed on SSD
    #settings.swappath = "/home/${global.mainUser}/.swapspace";
  };



  hardware = {
    graphics.enable = true;
  };



  networking.hostName = "${mainUser.option}";



  services.openssh.settings.AllowUsers = [ "${allowedSSHUser.option}" ];



  environment.variables = {
    SSH_ASKPASS_REQUIRE = "prefer";
  };



  services = {
    printing.enable = true; # Enables CUPS

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

  };



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;



  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";



  users.users.${mainUser.option} = { # define a user account
    isNormalUser = true;
    extraGroups = [ "wheel" "git" "networkmanager"];

    packages = with pkgs; [
      tree
    ];

  };







}

