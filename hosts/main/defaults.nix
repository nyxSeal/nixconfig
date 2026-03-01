{


  perSystem = {config, lib, ... }: {

    imports = [
      ./../../modules/modulebundle.nix
    ];

    entertainment.enable = lib.mkForce true;
    gui.enable = lib.mkForce true;
    gui.option = lib.mkForce "kde";


    # User inputs
    mainUser.option = lib.mkForce "nyxSeal";
    hostName.option = lib.mkForce "nixy";
    gitUsername.option = lib.mkForce "nyxSeal";
    gitEmail.option = lib.mkForce "litigate_putdown.zigzagged008@slmails.com";
    pathToDirectory.option = lib.mkForce ".nixconfig";
    allowedSSHUser.option = lib.mkForce "scattergun";
  };


}
