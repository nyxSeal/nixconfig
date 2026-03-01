{

  outputs = {config, lib, ... }: let
  vars = {
    mainUser = "nyxSeal";
    hostName = "nixy";
    gitUsername = "nyxSeal";
    gitEmail = "litigate_putdown.zigzagged008@slmails.com";
    pathToDirectory = ".nixconfig";
    allowedSSHUser = "scattergun";

  in {
    inherit vars;
    imports = [
      ./../../modules/moduleBundle.nix
    ];
    entertainment.enable = lib.mkForce true;
    gui.enable = lib.mkForce true;
    gui.option = lib.mkForce "kde";
    basicservices.enable = lib.mkForce true;

  };




}
