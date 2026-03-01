{config, lib, ...}: { 



  config.mainUser = "nyxSeal";
  config.hostName = "nixy";
  config.allowedSshUser = "scattergun";
  
 
    

  imports = [
    ./../../modules/modulebundle.nix
  ];


  config.entertainment.enable = lib.mkForce true;
  config.gui.enable = lib.mkForce true;
  config.kde.enable = lib.mkForce true;
  config.niri.enable = lib.mkForce false;
  config.basicservices.enable = lib.mkForce true;
  config.home-manager.enable = lib.mkForce true;




}
