{config, lib, pkgs, ...}: { 

  imports = [
    ./../../modules/modulebundle.nix
    ./hardware-configuration.nix
  ];


  config = {

    # user info
    mainUser = "scattergun";
    hostName = "scout";
    allowedSshUser = "nyxSeal";
 

    # system
    grub-boot.enable = lib.mkForce true;


    # user declaration
    users.users."${config.mainUser}" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "git" "networkmanager" ];

      packages = [
        pkgs.tree
      ];

    };


  };



}
